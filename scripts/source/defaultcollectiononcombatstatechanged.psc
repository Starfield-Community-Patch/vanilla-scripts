ScriptName DefaultCollectionOnCombatStateChanged Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members' combat state changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference THIS RefCollection's members are getting into combat with
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property IncludeOnHitEvent = True Auto Const
  { If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor. }
  Int Property CombatStateToCheckFor = 4 Auto Const
  { 0: Not In Combat
1: In Combat
2: Searching
4 (Default): In Combat or Searching }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If IncludeOnHitEvent
    Self.RegisterOnHitFilters()
  EndIf
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  If IncludeOnHitEvent
    Self.RegisterOnHitFilters()
  EndIf
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.CombatStateChangedOrHit(akTarget, akAggressor)
EndEvent

Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0 && CombatStateToCheckFor == 4 || aeCombatState == CombatStateToCheckFor
    Self.CombatStateChangedOrHit(akSenderRef, akTarget)
  EndIf
EndEvent

Function CombatStateChangedOrHit(ObjectReference akSenderRef, ObjectReference TargetOrAggressor)
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(StageToSet) == False && (PrereqStage < 0 || myQuest.GetStageDone(PrereqStage)) && (TurnOffStage < 0 || myQuest.GetStageDone(TurnOffStage) == False)
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(TargetOrAggressor, akSenderRef.GetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
  EndIf
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad(ObjectReference akSenderRef)
    ; Empty function
  EndEvent
EndState
