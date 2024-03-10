ScriptName Fragments:Quests:QF__01001C34 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property pse_tradeshipUC_01_AcceptSceneCOPY0000 Auto Const mandatory
Scene Property pse_tradeshipUC_01_HailingSceneCOPY0000 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0007_Item_00()
  pse_tradeshipUC_01_HailingSceneCOPY0000.start()
EndFunction
