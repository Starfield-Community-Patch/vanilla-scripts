ScriptName ShipVendorListScript Extends Activator
{ Contains a list of ships that should be sold by a ship vendor. }

;-- Structs -----------------------------------------
Struct ShipToSell
  leveledspaceshipbase leveledShip
  Int minLevel = 1
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
shipvendorlistscript:shiptosell[] Property ShipList Auto Const
{ List of ships to sell. }
