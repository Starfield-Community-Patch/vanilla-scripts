ScriptName Fragments:Quests:QF__01001635 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property Attack01_100a_DefenderHailStart Auto Const mandatory
MiscObject Property InorgCommonHelium3 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Alias_HailingShip.RefillAlias()
  Attack01_100a_DefenderHailStart.Start()
EndFunction

Function Fragment_Stage_0175_Item_00()
  Game.GetPlayer().AddItem(InorgCommonHelium3 as Form, 3, False)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 350, False)
EndFunction
