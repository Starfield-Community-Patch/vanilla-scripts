ScriptName Fragments:Quests:QF_SE_TradeShip_DataBroker_0010FAE5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property pse_tradeshipUC_01_AcceptSceneCOPY0000 Auto Const mandatory
Scene Property pse_tradeshipUC_01_HailingSceneCOPY0000 Auto Const mandatory
Scene Property Pse_tradeshipDataBroker_01_HailingScene Auto Const mandatory
GlobalVariable Property PSE_TradeShip_DataBrokerIsDead Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Pse_tradeshipDataBroker_01_HailingScene.start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  PSE_TradeShip_DataBrokerIsDead.SetValue(1.0)
EndFunction
