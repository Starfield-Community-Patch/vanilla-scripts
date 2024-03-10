ScriptName DefaultRefOnHit Extends DefaultRef default
{ Sets stage when THIS object is hit.
<RefToCheck> is the reference hitting THIS Object.
<LocationToCheck> is the current location of THIS object.

SEE ALSO DefaultRefOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultRefOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile) }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterOnHitFilters()
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, Self.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  If DoOnce == False
    Self.RegisterOnHitFilters()
  EndIf
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function
  EndEvent
EndState
