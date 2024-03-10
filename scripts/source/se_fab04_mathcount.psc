ScriptName SE_FAB04_MathCount Extends Quest
{ Calculate the total number of ship parts the player has for both ship and inventory }

;-- Variables ---------------------------------------
Int CargoShipParts
Int PlayerShipParts

;-- Properties --------------------------------------
GlobalVariable Property InventoryTotal Auto Const mandatory
Form Property ItemToRemove Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Int Property RequiredParts = 10 Auto

;-- Functions ---------------------------------------

Function CountShipParts()
  CargoShipParts = Alias_PlayerShip.GetRef().GetItemCount(ItemToRemove)
  PlayerShipParts = Game.GetPlayer().GetItemCount(ItemToRemove)
  Int TotalParts = CargoShipParts + PlayerShipParts
  InventoryTotal.SetValue(TotalParts as Float)
EndFunction

Function RemoveShipParts()
  spaceshipreference ShipRef = Alias_PlayerShip.GetShipRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  If CargoShipParts >= RequiredParts
    ShipRef.RemoveItem(ItemToRemove, RequiredParts, False, None)
  Else
    Int NumberOfPartsRemoved = ShipRef.RemoveItem(ItemToRemove, CargoShipParts, False, None)
    Int RemainingPartRemoval = RequiredParts - NumberOfPartsRemoved
    PlayerRef.RemoveItem(ItemToRemove, RemainingPartRemoval, False, None)
  EndIf
EndFunction
