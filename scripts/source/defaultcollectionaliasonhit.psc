ScriptName DefaultCollectionAliasOnHit Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members are hit.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference hitting each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.

SEE ALSO DefaultCollectionOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultCollectionOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property SpellHits_HostileOnly = True Auto Const
  { (Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit. }
EndGroup


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
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, akTarget.GetCurrentLocation(), None)
  Spell sourceSpell = akSource as Spell
  If SpellHits_HostileOnly == False || sourceSpell == None || sourceSpell.IsHostile()
    Self.CheckAndSetStageAndCallDoSpecificThing(akTarget, ParentScriptFunctionParams)
  EndIf
  If DoOnce == False
    Self.RegisterOnHitFilters()
  EndIf
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad(ObjectReference akSenderRef)
    ; Empty function
  EndEvent
EndState
