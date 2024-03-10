ScriptName Fragments:Quests:QF_SE_FAB25_00029CC8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Potion Property DrinkPack_Orange_Juice Auto Const mandatory
Float Property RunTime Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef()
  ShipRef.BlockActivation(True, True)
  Utility.Wait(RunTime)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().AddItem(DrinkPack_Orange_Juice as Form, 1, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction
