ScriptName DefaultCaptiveAlias Extends ReferenceAlias default
{ Use this script to gain standard support for bound captive npcs being freed by player.

WARNING: Dual use of DefaultCaptiveAlias AND DefaultCaptiveWoundedAlias on the same NPC is not currently supported.

Let system design know if this is an important need. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutoFillProperties
  sq_captivescript Property SQ_Captive Auto Const mandatory
  Faction Property CaptiveFaction Auto Const mandatory
  Keyword Property SQ_Link_CaptiveFurniture Auto Const mandatory
  Faction Property BoundFaction Auto Const mandatory
  ActorValue Property SQ_CaptiveState Auto Const mandatory
  GlobalVariable Property SQ_CaptiveState_0_Unset Auto Const mandatory
  GlobalVariable Property SQ_CaptiveState_1_Captive Auto Const mandatory
  GlobalVariable Property SQ_CaptiveState_2_Freed Auto Const mandatory
  Keyword Property SQ_Captive_DialogueSubtype_FreedPrisonerGratitude Auto Const mandatory
  Keyword Property SQ_Captive_FurnitureType_Bound Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
EndGroup

Group MainProperties
  Bool Property StartBound = True Auto Const
  { if true, captive is bound }
  Bool Property DisableOnUnload = False Auto Const
  { after being freed, this actor will disable when unloaded }
  Bool Property AlsoRemoveFromCaptiveFaction = False Auto Const
  { after being freed, this actor will also be removed from the CaptiveFaction
		Use this for actors that will be attacked while fleeing }
EndGroup

Group SetStageProperties
  Quest Property QuestToSet Auto
  { If this is set, set the stage on this quest if StageToSetWhenFreed is not -1
		If QuestToSet is NOT set, it will try to set the stage on the owning quest }
  Int Property StageToSetWhenFreed = -1 Auto Const
  { this stage will be set when the prisoner is freed }
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
  Self.RegisterForCustomEvent(SQ_Captive as ScriptObject, "sq_captivescript_CaptiveSetFree")
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
    If StartBound
      captiveActor.AddToFaction(BoundFaction)
    EndIf
  EndIf
EndFunction

Function SetState()
  Actor actorRef = Self.GetActorRef()
  If actorRef as Bool && actorRef.IsInFaction(BoundFaction)
    actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_1_Captive.GetValue())
    If actorRef.Is3DLoaded()
      ObjectReference captiveFurniture = actorRef.GetLinkedRef(SQ_Link_CaptiveFurniture)
      If captiveFurniture
        actorRef.SnapIntoInteraction(captiveFurniture)
      EndIf
    EndIf
    actorRef.SetRestrained(True)
  EndIf
EndFunction

Event SQ_CaptiveScript.CaptiveSetFree(sq_captivescript akSender, Var[] akArgs)
  Actor captive = akArgs[0] as Actor
  Bool playerIsLiberator = akArgs[1] as Bool
  Bool showInventory = akArgs[2] as Bool
  If captive as ObjectReference == Self.GetReference()
    Self.FreePrisoner(playerIsLiberator, showInventory)
  EndIf
EndEvent

Function CleanupIfReady()
  Actor actorRef = Self.GetActorRef()
  If actorRef.IsInFaction(BoundFaction) == False
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
  If AlsoRemoveFromCaptiveFaction && actorRef.IsInFaction(BoundFaction) == False
    actorRef.RemoveFromFaction(CaptiveFaction)
  EndIf
EndFunction

Function FreePrisoner(Bool playerIsLiberator, Bool OpenPrisonerInventory)
  Actor actorRef = Self.GetActorRef()
  actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_2_Freed.GetValue())
  actorRef.RemoveFromFaction(BoundFaction)
  Self.RemoveFromCaptiveFactionIfNeeded()
  actorRef.SetRestrained(False)
  actorRef.EvaluatePackage(False)
  If OpenPrisonerInventory
    actorRef.openInventory(True, None, True)
  EndIf
  actorRef.SayCustom(SQ_Captive_DialogueSubtype_FreedPrisonerGratitude, None, False, None)
  If StageToSetWhenFreed > -1
    If QuestToSet
      QuestToSet.SetStage(StageToSetWhenFreed)
    Else
      Self.GetOwningQuest().SetStage(StageToSetWhenFreed)
    EndIf
  EndIf
  actorRef.EvaluatePackage(False)
EndFunction

Function ClearFactions()
  Actor actorRef = Self.GetActorRef()
  actorRef.RemoveFromFaction(CaptiveFaction)
  actorRef.RemoveFromFaction(BoundFaction)
EndFunction

Function ResetAVs()
  Actor actorRef = Self.GetActorRef()
  actorRef.SetValue(SQ_CaptiveState, SQ_CaptiveState_0_Unset.GetValue())
EndFunction
