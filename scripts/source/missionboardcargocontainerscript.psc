ScriptName MissionBoardCargoContainerScript Extends ObjectReference Const
{ holds data for the cargo this container represents }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property CargoMiscObject Auto Const
{ misc object to use to create cargo in inventory }
Int Property CargoWeightMultMin = 15 Auto Const
{ cargo items will be randomized between min and max }
Int Property CargoWeightMultMax = 200 Auto Const
{ cargo items will be randomized between min and max }

;-- Functions ---------------------------------------

Function CreateCargo(RefCollectionAlias CargoCollection, Int cargoItems)
  Int I = 0
  While I < cargoItems
    ObjectReference cargoRef = Self.PlaceAtMe(CargoMiscObject as Form, 1, False, True, True, None, CargoCollection as Alias, True)
    I += 1
  EndWhile
EndFunction
