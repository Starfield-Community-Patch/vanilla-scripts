ScriptName LC165ShiftingTriggerScript Extends ObjectReference
{ Script for the memory space shifting triggers in LC165, Buried Temple. }

;-- Variables ---------------------------------------
Actor[] stopCombatWith

;-- Properties --------------------------------------
Group ReferenceProperties
  String Property ShiftName Auto Const
  { Name of the shift to trigger. }
  Int Property DisableStage Auto Const
  { When this stage is set, disable this trigger and its linked chain of distortion vfx. }
  Int Property DistortionID = -1 Auto Const
  { When the player enters this distortion, call LC165QuestScript's DistortionEntered function with this ID to update objectives. }
  ReferenceAlias Property ActorToStopCombatWith01 Auto Const
  { Actor to stop combat with when the player enters this distortion. }
  ReferenceAlias Property ActorToStopCombatWith02 Auto Const
  { Actor to stop combat with when the player enters this distortion. }
  RefCollectionAlias Property ActorsToStopCombatWith Auto Const
  { Actors to stop combat with when the player enters this distortion. }
EndGroup

Group AutofillProperties collapsedonref
  lc165shiftingquestscript Property MQ302B Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(MQ302B as ScriptObject, "OnStageSet")
  stopCombatWith = ActorsToStopCombatWith.GetArray() as Actor[]
  If stopCombatWith == None
    stopCombatWith = new Actor[0]
  EndIf
  If ActorToStopCombatWith01 != None
    stopCombatWith.add(ActorToStopCombatWith01.GetActorRef(), 1)
  EndIf
  If ActorToStopCombatWith02 != None
    stopCombatWith.add(ActorToStopCombatWith02.GetActorRef(), 1)
  EndIf
EndEvent

Event OnUnload()
  stopCombatWith = None
EndEvent

Event OnTriggerEnter(ObjectReference akTriggerRef)
  ObjectReference[] linkedDistortions = Self.GetLinkedRefChain(None, 100)
  If linkedDistortions == None || linkedDistortions.Length == 0
    MQ302B.ShiftTo(ShiftName, "", None, DistortionID, stopCombatWith)
  ElseIf linkedDistortions.Length == 1
    MQ302B.ShiftTo(ShiftName, "", linkedDistortions[0], DistortionID, stopCombatWith)
  Else
    ObjectReference closestDistortion = linkedDistortions[0]
    Float closestDistortionDistance = Game.GetPlayer().GetDistance(closestDistortion)
    Int I = 1
    While I < linkedDistortions.Length
      ObjectReference currentDistortion = linkedDistortions[I]
      Float currentDistortionDistance = Game.GetPlayer().GetDistance(currentDistortion)
      If currentDistortionDistance < closestDistortionDistance
        closestDistortion = currentDistortion
        closestDistortionDistance = currentDistortionDistance
      EndIf
      I += 1
    EndWhile
    MQ302B.ShiftTo(ShiftName, "", closestDistortion, DistortionID, stopCombatWith)
  EndIf
EndEvent

Event Quest.OnStageSet(Quest akSource, Int auiStageID, Int auiItemID)
  If (akSource == MQ302B as Quest) && auiStageID == DisableStage
    Self.DisableNoWait(False)
    ObjectReference[] linkedDistortions = Self.GetLinkedRefChain(None, 100)
    Int I = 0
    While I < linkedDistortions.Length
      linkedDistortions[I].DisableNoWait(False)
      I += 1
    EndWhile
  EndIf
EndEvent
