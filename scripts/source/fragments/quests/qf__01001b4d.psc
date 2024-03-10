ScriptName Fragments:Quests:QF__01001B4D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Keyword Property TestKurtShipDeathKeyword Auto Const mandatory
Scene Property SE_KMK01HailingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  SE_KMK01HailingScene.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_playerShip.GetRef().RemoveItem(ShipRepairKit as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0500_Item_00()
  TestKurtShipDeathKeyword.SendStoryEvent(None, Alias_Ship01.GetRef(), None, 0, 0)
EndFunction
