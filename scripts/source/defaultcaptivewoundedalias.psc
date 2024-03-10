ScriptName DefaultCaptiveWoundedAlias Extends ReferenceAlias
{ Use this script to gain standard support for wounded captive npcs being healed by player.

WARNING: Dual use of DefaultCaptiveAlias AND DefaultCaptiveWoundedAlias on the same NPC is not currently supported.

Let system design know if this is an important need. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutoFillProperties
  sq_captivescript Property SQ_Captive Auto Const mandatory
  Faction Property CaptiveFaction Auto Const mandatory
  Keyword Property SQ_Link_CaptiveFurniture Auto Const mandatory
  Faction Property WoundedFaction Auto Const mandatory
  ActorValue Property SQ_WoundedState Auto Const mandatory
  GlobalVariable Property SQ_WoundedState_0_Unset Auto Const mandatory
  GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
  GlobalVariable Property SQ_WoundedState_2_Healed Auto Const mandatory
  Keyword Property SQ_Wounded_DialogueSubtype_HealedActorGratitude Auto Const mandatory
  Keyword Property SQ_Captive_FurnitureType_Wounded Auto Const mandatory
EndGroup

Group MainProperties
  Bool Property StartWounded = True Auto Const
  { if true, captive is wounded }
  Bool Property DisableOnUnload = False Auto Const
  { after being freed, this actor will disable when unloaded }
  Bool Property AlsoRemoveFromCaptiveFaction = False Auto Const
  { after being freed, this actor will also be removed from the CaptiveFaction
		Use this for actors that will be attacked while fleeing }
EndGroup

Group SetStageProperties
  Quest Property QuestToSet Auto
  { If this is set, set the stage on this quest if StageToSetWhenHealed is not -1
		If QuestToSet is NOT set, it will try to set the stage on the owning quest }
  Int Property StageToSetWhenHealed = -1 Auto Const
  { this stage will be set when the victim is healed }
  Int Property StageToSetOnCleanUp = -1 Auto Const
  { this stage will be set when we try to clean up the actor }
EndGroup

Group CleanUpProperties
  Bool Property RemoveFromFactions = True Auto Const
  { if true (default), will remove from factions added by this script when cleaned up }
  Bool Property DeleteWhenCleanedUp = False Auto Const
  { if true, will delete when cleaned up }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForCustomEvent(SQ_Captive as ScriptObject, "sq_captivescript_WoundedActorHealed")
  Self.AddToFactions()
  Self.SetState()
EndEvent

Event OnAliasShutdown()
  Self.ClearFactions()
  Self.ResetAVs()
  Self.CleanupIfReady()
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False
    Self.AddToFactions()
    Self.SetState()
  EndIf
EndEvent

Event OnLoad()
  Self.SetState()
EndEvent

Event OnUnload()
  If DisableOnUnload
    Self.GetReference().Disable(False)
  EndIf
EndEvent

Function AddToFactions()
  Actor captiveActor = Self.GetActorReference()
  If captiveActor
    captiveActor.AddToFaction(CaptiveFaction)
    If StartWounded
      captiveActor.AddToFaction(WoundedFaction)
    EndIf
  EndIf
EndFunction

Function SetState()
  Actor actorRef = Self.GetActorRef()
  If actorRef.IsInFaction(WoundedFaction)
    actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue())
    If actorRef.Is3DLoaded()
      ObjectReference captiveFurniture = actorRef.GetLinkedRef(SQ_Link_CaptiveFurniture)
      If captiveFurniture
        actorRef.SnapIntoInteraction(captiveFurniture)
      EndIf
    EndIf
    actorRef.SetRestrained(True)
  EndIf
EndFunction

Event SQ_CaptiveScript.WoundedActorHealed(sq_captivescript akSender, Var[] akArgs)
  Actor woundedActor = akArgs[0] as Actor
  Bool playerIsHealer = akArgs[1] as Bool
  Bool showInventory = akArgs[2] as Bool
  If woundedActor as ObjectReference == Self.GetReference()
    Self.HealActor(playerIsHealer)
  EndIf
EndEvent

Function CleanupIfReady()
  Actor actorRef = Self.GetActorRef()
  If actorRef.IsInFaction(WoundedFaction) == False
    If RemoveFromFactions
      Self.ClearFactions()
    EndIf
    If DeleteWhenCleanedUp
      actorRef.Disable(False)
      actorRef.Delete()
    EndIf
    If StageToSetOnCleanUp > -1
      If QuestToSet
        QuestToSet.SetStage(StageToSetOnCleanUp)
      Else
        Self.GetOwningQuest().SetStage(StageToSetOnCleanUp)
      EndIf
    EndIf
  EndIf
EndFunction

Function RemoveFromCaptiveFactionIfNeeded()
  Actor actorRef = Self.GetActorRef()
  If AlsoRemoveFromCaptiveFaction && actorRef.IsInFaction(WoundedFaction) == False
    actorRef.RemoveFromFaction(CaptiveFaction)
  EndIf
EndFunction

Function HealActor(Bool playerIsHealer)
  Actor actorRef = Self.GetActorRef()
  actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_2_Healed.GetValue())
  actorRef.RemoveFromFaction(WoundedFaction)
  Self.RemoveFromCaptiveFactionIfNeeded()
  actorRef.SetRestrained(False)
  actorRef.EvaluatePackage(False)
  actorRef.SayCustom(SQ_Wounded_DialogueSubtype_HealedActorGratitude, None, False, None)
  If StageToSetWhenHealed > -1
    If QuestToSet
      QuestToSet.SetStage(StageToSetWhenHealed)
    Else
      Self.GetOwningQuest().SetStage(StageToSetWhenHealed)
    EndIf
  EndIf
  actorRef.EvaluatePackage(False)
EndFunction

Function ClearFactions()
  Actor actorRef = Self.GetActorRef()
  actorRef.RemoveFromFaction(CaptiveFaction)
  actorRef.RemoveFromFaction(WoundedFaction)
EndFunction

Function ResetAVs()
  Actor actorRef = Self.GetActorRef()
  actorRef.SetValue(SQ_WoundedState, SQ_WoundedState_0_Unset.GetValue())
EndFunction
