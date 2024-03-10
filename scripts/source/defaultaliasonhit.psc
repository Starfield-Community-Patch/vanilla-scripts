ScriptName DefaultAliasOnHit Extends DefaultAlias default
{ Sets stage when THIS Alias is hit.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference hitting THIS Alias.
<LocationToCheck> is the current location of THIS Alias.

SEE ALSO DefaultAliasOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultAliasOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property SpellHits_HostileOnly = True Auto Const
  { (Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If Self.GetReference().Is3DLoaded()
    Self.RegisterOnHitFilters()
  EndIf
EndEvent

Event OnLoad()
  Self.RegisterOnHitFilters()
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, Self.TryToGetCurrentLocation(), None)
  Spell sourceSpell = akSource as Spell
  If SpellHits_HostileOnly == False || sourceSpell == None || sourceSpell.IsHostile()
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndIf
  Self.RegisterOnHitFilters()
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function
  EndEvent
EndState
