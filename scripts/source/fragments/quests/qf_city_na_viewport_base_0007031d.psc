ScriptName Fragments:Quests:QF_City_NA_Viewport_Base_0007031D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property NewArrival Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(NewArrival as Form, 1, False)
EndFunction
