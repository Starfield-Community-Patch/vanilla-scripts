ScriptName Fragments:Quests:QF_FC08_SpaceEnc01_00256133 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_FirstShipA01 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipA02 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipB01 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipB02 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipB03 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipC01 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipC02 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipC03 Auto Const mandatory
ReferenceAlias Property Alias_FirstShipC04 Auto Const mandatory
RefCollectionAlias Property Alias_FirstShips_Wave01 Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
RefCollectionAlias Property Alias_FirstShips_Wave02 Auto Const mandatory
RefCollectionAlias Property Alias_FirstShips_Wave03 Auto Const mandatory
Form Property FC08_FirstShipA01 Auto Const mandatory
Form Property FC08_FirstShipA02 Auto Const mandatory
Form Property FC08_FirstShipB01 Auto Const mandatory
Form Property FC08_FirstShipB02 Auto Const mandatory
Form Property FC08_FirstShipB03 Auto Const mandatory
Form Property FC08_FirstShipC01 Auto Const mandatory
Form Property FC08_FirstShipC02 Auto Const mandatory
Form Property FC08_FirstShipC03 Auto Const mandatory
Form Property FC08_FirstShipC04 Auto Const mandatory
Quest Property PFC08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_FirstShipA01.GetShipReference().EnableWithGravJump()
  Alias_FirstShipA02.GetShipReference().EnableWithGravJump()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_FirstShipB01.GetShipReference().EnableWithGravJump()
  Alias_FirstShipB02.GetShipReference().EnableWithGravJump()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_FirstShipC01.GetShipReference().EnableWithGravJump()
  Alias_FirstShipC02.GetShipReference().EnableWithGravJump()
EndFunction

Function Fragment_Stage_0500_Item_00()
  PFC08.SetStage(300)
EndFunction
