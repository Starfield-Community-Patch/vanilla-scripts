ScriptName DefaultAliasOnShipDock Extends DefaultAlias default
{ Sets stage when this ship initiates docking with another ship.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is based on the value of WhichShipToCheck - see below
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property SetStageWhenDockingComplete = True Auto Const
  { If true (default), stage will be set when docking is complete; if false, stage will be set when docking begins. }
  Int Property WhichShipToCheck = 0 Auto Const
  { 0 = check both docking ships
	 1 = check this ship only
	 2 = check the other ship only }
EndGroup


;-- Functions ---------------------------------------

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If SetStageWhenDockingComplete == abComplete
    Location currentLocation = Self.TryToGetCurrentLocation()
    spaceshipreference myShip = Self.GetShipRef()
    spaceshipreference otherShip = None
    If myShip == akDocking
      otherShip = akParent
    Else
      otherShip = akDocking
    EndIf
    If WhichShipToCheck == 0 || WhichShipToCheck == 1
      defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(myShip as ObjectReference, currentLocation, None)
      Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams)
    EndIf
    If WhichShipToCheck == 0 || WhichShipToCheck == 2
      defaultscriptfunctions:parentscriptfunctionparams parentscriptfunctionparams = defaultscriptfunctions.BuildParentScriptFunctionParams(otherShip as ObjectReference, currentLocation, None)
      Self.CheckAndSetStageAndCallDoSpecificThing(parentscriptfunctionparams)
    EndIf
    If WhichShipToCheck < 0 || WhichShipToCheck > 2
      
    EndIf
  EndIf
EndEvent
