ScriptName DefaultRefOnCombatStateChanged Extends DefaultActor default
{ Sets stage when THIS actor's combat state changes.
<RefToCheck> is the reference THIS actor is getting into combat with.
<LocationToCheck> is the current location of THIS actor's reference. }

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

Event OnLoad()
  If IncludeOnHitEvent
    Self.RegisterOnHitFilters()
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Self.CombatStateChangedOrHit(akAggressor)
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0 && CombatStateToCheckFor == 4 || aeCombatState == CombatStateToCheckFor
    Self.CombatStateChangedOrHit(akTarget)
  EndIf
EndEvent

Function CombatStateChangedOrHit(ObjectReference TargetOrAggressor)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(TargetOrAggressor, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function
  EndEvent
EndState
