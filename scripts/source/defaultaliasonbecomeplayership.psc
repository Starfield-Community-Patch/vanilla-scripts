ScriptName DefaultAliasOnBecomePlayerShip Extends DefaultAliasParent default
{ sets stage and removes factions from this alias's ship when it becomes the current player ship (i.e. player sits in the pilot seat)
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { autofill - used to register for player ship change event }
  Faction[] Property FactionsToRemove Auto Const
  { factions to remove when this ship becomes the player ship }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForCustomEvent(SQ_PlayerShip as ScriptObject, "sq_playershipscript_SQ_PlayerShipChanged")
EndEvent

Event SQ_PlayerShipScript.SQ_PlayerShipChanged(sq_playershipscript akSender, Var[] akArgs)
  spaceshipreference newPlayerShip = akArgs[0] as spaceshipreference
  If newPlayerShip == Self.GetShipRef()
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, Self.TryToGetCurrentLocation(), None)
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
  EndIf
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  Int I = 0
  While I < FactionsToRemove.Length
    Self.TryToRemoveFromFaction(FactionsToRemove[I])
    I += 1
  EndWhile
EndFunction
