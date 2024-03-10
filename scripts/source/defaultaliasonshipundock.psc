ScriptName DefaultAliasOnShipUndock Extends DefaultAlias default
{ Sets stage when this ship undocks from another ship.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is based on the value of WhichShipToCheck - see below
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property SetStageWhenUndockingComplete = True Auto Const
  { If true (default), stage will be set when undocking is complete; if false, stage will be set when undocking begins. }
  Int Property WhichShipToCheck = 0 Auto Const
  { 0 = check both docking ships
	 1 = check this ship only
	 2 = check the other ship only }
EndGroup


;-- Functions ---------------------------------------

Event OnShipUndock(Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If SetStageWhenUndockingComplete == abComplete
    Location currentLocation = Self.TryToGetCurrentLocation()
    spaceshipreference myShip = Self.GetShipRef()
    spaceshipreference otherShip = None
    If myShip == akUndocking
      otherShip = akParent
    Else
      otherShip = akUndocking
    EndIf
    If WhichShipToCheck == 0 || WhichShipToCheck == 1
      defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(myShip as ObjectReference, currentLocation, None)
      Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
    EndIf
    If WhichShipToCheck == 0 || WhichShipToCheck == 2
      defaultscriptfunctions:parentscriptfunctionparams parentscriptfunctionparams = defaultscriptfunctions.BuildParentScriptFunctionParams(otherShip as ObjectReference, currentLocation, None)
      Self.CheckAndSetStageAndCallDoSpecificThing(parentscriptfunctionparams)
    EndIf
    If WhichShipToCheck < -1 || WhichShipToCheck > 2
      
    EndIf
  EndIf
EndEvent
