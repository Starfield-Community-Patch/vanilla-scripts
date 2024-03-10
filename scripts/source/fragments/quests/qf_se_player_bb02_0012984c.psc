ScriptName Fragments:Quests:QF_SE_Player_BB02_0012984C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
MiscObject Property credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.GetPlayer().AddItem(credits as Form, 2000, False)
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.SetGhost(True)
  oTarg.BlockActivation(True, True)
  Utility.Wait(3.0)
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Utility.Wait(5.0)
  Alias_HailingShip.GetShipRef().Kill(None)
EndFunction
