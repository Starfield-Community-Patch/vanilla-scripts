ScriptName DefaultActivateLinkedRefOnCombat Extends DefaultActor default
{ Activates THIS actor's linked ref when THIS actor's combat state changes.
<RefToCheck> is the reference THIS actor is getting into combat with.
<LocationToCheck> is the current location of THIS actor's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Bool Property IncludeOnHitEvent = True Auto Const
  { If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor. }
  Int Property CombatStateToCheckFor = 4 Auto Const
  { 0: Not In Combat
1: In Combat
2: Searching
4 (Default): In Combat or Searching }
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
  Bool Property ActivatorIsRefToCheck = True Auto Const
  { If true (default), Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object. }
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

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100)
  Else
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray()
  EndIf
EndFunction

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

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ObjectReference ActivatorRef = Self as ObjectReference
  If ActivatorIsRefToCheck
    ActivatorRef = ParentScriptFunctionParams.RefToCheck
  EndIf
  RefToDoThingWith.Activate(ActivatorRef, False)
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function
  EndEvent
EndState
