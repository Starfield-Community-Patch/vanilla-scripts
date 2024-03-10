ScriptName RQ_PlaceObjectScript Extends RQScript

;-- Variables ---------------------------------------
Int iDebugNextActivator

;-- Properties --------------------------------------
Group PlacedObject_Properties
  ReferenceAlias Property ObjectToPlace Auto Const mandatory
  { an example of object to place. Quest creates a disabled one in this alias so that we can use it for text replacement, as well as placing more when player activates InteractionActivators }
  packin Property ObjectToPlaceBase Auto Const mandatory
  { base object for placing - should match what's in ObjectToPlace }
  Keyword Property InteractionActivatorLinkKeyword Auto Const mandatory
  { keyword used in packin that links the Pivot TO the activator volume
	Example:
	For Env_Hazard* this is: Env_Link_InteractionActivator }
  RefCollectionAlias Property InteractionTargets Auto Const mandatory
  { ref col having refs to place InteractionActivatorRefs at (ie to give them a "click here" volume) }
  RefCollectionAlias Property InteractionActivators Auto Const mandatory
  { ref col to force placed HazardInteractionTriggers into }
  Int Property MinActivators = 3 Auto Const
  Int Property MaxActivators = 8 Auto Const
  GlobalVariable Property RQ_Settlement_PlaceObject_01_MaxCount Auto Const mandatory
  { used for text replacement }
  GlobalVariable Property CreditsRewardRadiantQuestSmall Auto Const mandatory
  { base value for quest reward }
  GlobalVariable Property RQ_Settlement_PlaceObject_01_CreditsReward Auto Const mandatory
  { actual value for quest reward - modified by number of activators actually placed }
  packin Property ENV_HazardInteraction_PK_Vent Auto Const mandatory
  { autofill }
  Static Property PrefabPackinPivotDummy Auto Const mandatory
  { autofill }
EndGroup


;-- Functions ---------------------------------------

Event RefCollectionAlias.OnActivate(RefCollectionAlias akSender, ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    env_hazard_interactionactivator hazardActivator = akSenderRef as env_hazard_interactionactivator
    If hazardActivator
      hazardActivator.PlaceObject(ObjectToPlaceBase as Form, None)
    EndIf
    akSenderRef.Disable(False)
  EndIf
EndEvent

Function PlaceInteractionActivators()
  Self.RegisterForRemoteEvent(InteractionActivators as ScriptObject, "OnActivate")
  ObjectReference[] interactionTargetRefs = InteractionTargets.GetArray()
  Int randomMaxActivators = Utility.RandomInt(MinActivators, MaxActivators)
  Int I = 0
  While I < interactionTargetRefs.Length && I < randomMaxActivators
    ObjectReference placedRef = interactionTargetRefs[I].PlaceAtMe(ENV_HazardInteraction_PK_Vent as Form, 1, False, False, True, None, None, True)
    placedRef = interactionTargetRefs[I].FindAllReferencesOfType(PrefabPackinPivotDummy as Form, 1.0)[0]
    ObjectReference activatorRef = placedRef.GetLinkedRef(InteractionActivatorLinkKeyword)
    InteractionActivators.AddRef(activatorRef)
    I += 1
  EndWhile
  RQ_Settlement_PlaceObject_01_MaxCount.SetValueInt(I)
  RQ_Settlement_PlaceObject_01_CreditsReward.SetValueInt(Math.Floor((CreditsRewardRadiantQuestSmall.GetValue() * I as Float) / MaxActivators as Float))
  Self.UpdateCurrentInstanceGlobal(RQ_Settlement_PlaceObject_01_MaxCount)
EndFunction

Function DebugMoveToNextActivator()
  Game.GetPlayer().MoveTo(InteractionActivators.GetAt(iDebugNextActivator), 0.0, 0.0, 0.0, True, False)
  iDebugNextActivator += 1 % InteractionActivators.GetCount()
EndFunction
