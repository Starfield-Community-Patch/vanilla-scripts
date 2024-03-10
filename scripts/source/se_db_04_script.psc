ScriptName SE_DB_04_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property HailingShip Auto Const mandatory
Form Property LootItem Auto Const mandatory
{ The specific loot item type that will be placed. }

;-- Functions ---------------------------------------

Function DropLoot()
  ObjectReference Spawnpoint = HailingShip.GetShipReference() as ObjectReference
  Spawnpoint.PlaceAtMe(LootItem, 1, False, False, True, None, None, True)
EndFunction
