ScriptName Fragments:Quests:QF_SE_TradeShip_UC_0012EB39 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property pse_tradeshipUC_01_AcceptSceneCOPY0000 Auto Const mandatory
Scene Property pse_tradeshipUC_01_HailingSceneCOPY0000 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  pse_tradeshipUC_01_HailingSceneCOPY0000.start()
EndFunction
