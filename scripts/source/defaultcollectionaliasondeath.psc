ScriptName DefaultCollectionAliasOnDeath Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members are killed.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference killing each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property UseOnDyingInstead = False Auto Const
  { (Default: false) If true, stage will be set when OnDying() event is sent. If false, stage will be sent with OnDeath() event is sent. }
  Bool Property RemoveFromRefCollection = False Auto Const
  { (Default: false) If true, after executing script functionality, will remove each reference from the collection when it dies. }
  sq_playershipscript Property SQ_PlayerShip Auto Const
  { autofill (but optional) - used to register for player ship change event }
  Bool Property CountShipTakeover = True Auto Const
  { only valid if SQ_PlayerShip is filled in; for spaceships, consider the player taking over a ship as killing it }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If SQ_PlayerShip as Bool && CountShipTakeover
    Self.RegisterForCustomEvent(SQ_PlayerShip as ScriptObject, "sq_playershipscript_SQ_PlayerShipChanged")
  EndIf
  Parent.OnAliasInit()
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If UseOnDyingInstead == False
    Self.DeathComplete(akSenderRef, akKiller)
  EndIf
EndEvent

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
  If UseOnDyingInstead == True
    Self.DeathComplete(akSenderRef, akKiller)
  EndIf
EndEvent

Event SQ_PlayerShipScript.SQ_PlayerShipChanged(sq_playershipscript akSender, Var[] akArgs)
  spaceshipreference newPlayerShip = akArgs[0] as spaceshipreference
  If CountShipTakeover && Self.Find(newPlayerShip as ObjectReference) > -1
    Self.DeathComplete(newPlayerShip as ObjectReference, Game.GetPlayer() as ObjectReference)
  EndIf
EndEvent

Function DeathComplete(ObjectReference akSenderRef, ObjectReference akKiller)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akKiller, akSenderRef.GetCurrentLocation(), None)
  Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams)
EndFunction

Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If RemoveFromRefCollection
    Self.RemoveRef(RefCollectionMemberRef)
  EndIf
EndFunction
