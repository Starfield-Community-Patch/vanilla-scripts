ScriptName Fragments:Quests:QF_MQ_TutorialQuest_00045640 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property Tutorial_ZeroG_MSGBox Auto Const mandatory
Message Property Tutorial_ShipLowHealthMSG Auto Const mandatory
Message Property Tutorial_ShipDamagedSystemMSG Auto Const mandatory
Message Property Tutorial_GravRange_MSGBox Auto Const mandatory
Message Property Tutorial_GravRange21_MSGBox Auto Const mandatory
Message Property Tutorial_NewHomeShip01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("ZeroG")
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("EMWeapons")
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Tutorial_ShipLowHealthMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  kmyQuest.ShowHelpMessage("ShipRepair")
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  Tutorial_ShipDamagedSystemMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(0.100000001)
  kmyQuest.ShowHelpMessage("ShipSystemDamage")
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  defaulttutorialquestscript kmyQuest = __temp as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("ShipEMWeapon")
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  mq_tutorialquestscript kmyQuest = __temp as mq_tutorialquestscript
  kmyQuest.StartPowerTutorial()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Tutorial_GravRange_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Tutorial_GravRange21_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Tutorial_NewHomeShip01.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction
