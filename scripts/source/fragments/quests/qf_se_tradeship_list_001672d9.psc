ScriptName Fragments:Quests:QF_SE_TradeShip_LIST_001672D9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property PSE_ZW01_FreestarHail Auto Const mandatory
Scene Property pse_TradeShip_LIST_01_HailingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0007_Item_00()
  pse_TradeShip_LIST_01_HailingScene.Start()
EndFunction
