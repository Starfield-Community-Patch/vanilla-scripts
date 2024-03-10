ScriptName Fragments:Scenes:SF_Player_HailTemplate_SE_Pl_00063A85 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
GlobalVariable Property SE_Player_AC03_Inventory01 Auto Const mandatory
GlobalVariable Property SE_Player_AC03_Inventory02 Auto Const mandatory
GlobalVariable Property SE_Player_AC03_Inventory03 Auto Const mandatory
MiscObject Property InorgRareLithium Auto Const mandatory
MiscObject Property InorgRareVanadium Auto Const mandatory
MiscObject Property InorgRarePlatinum Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_09_End()
  ; Empty function
EndFunction

Function Fragment_Phase_04_Begin()
  spaceshipreference PlayerShip = Alias_PlayerShip.GetShipRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  Int CargoShipParts01 = PlayerShip.GetItemCount(InorgRareLithium as Form)
  Int PlayerShipParts01 = PlayerRef.GetItemCount(InorgRareLithium as Form)
  Int TotalParts01 = CargoShipParts01 + PlayerShipParts01
  SE_Player_AC03_Inventory01.SetValue(TotalParts01 as Float)
  Int CargoShipParts02 = PlayerShip.GetItemCount(InorgRarePlatinum as Form)
  Int PlayerShipParts02 = PlayerRef.GetItemCount(InorgRarePlatinum as Form)
  Int TotalParts02 = CargoShipParts02 + PlayerShipParts02
  SE_Player_AC03_Inventory02.SetValue(TotalParts02 as Float)
  Int CargoShipParts03 = PlayerShip.GetItemCount(InorgRareVanadium as Form)
  Int PlayerShipParts03 = PlayerRef.GetItemCount(InorgRareVanadium as Form)
  Int TotalParts03 = CargoShipParts02 + PlayerShipParts03
  SE_Player_AC03_Inventory03.SetValue(TotalParts03 as Float)
EndFunction
