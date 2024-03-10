ScriptName UC04_RefColl_WarnIfHitScript Extends DefaultCollectionAliasOnHit

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property WeaponTypeEM Auto Const mandatory
{ Weapon type we're checking the player has equipped before triggering Hadrian's scene }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterOnHitFilters()
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterOnHitFilters()
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Actor PlayACT = Game.GetPlayer()
  If (akAggressor == PlayACT as ObjectReference) && PlayACT.WornHasKeyword(WeaponTypeEM)
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, akTarget.GetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(akTarget, ParentScriptFunctionParams)
    If DoOnce == False
      Self.RegisterOnHitFilters()
    EndIf
  EndIf
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad(ObjectReference akSenderRef)
    ; Empty function
  EndEvent
EndState
