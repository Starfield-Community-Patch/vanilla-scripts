ScriptName Fragments:Quests:QF_TemplateSceneQuestCOPY000_00017EB9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property TemplateScene01 Auto Const mandatory
Scene Property TemplateSceneNoPlayer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  TemplateScene01.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  TemplateSceneNoPlayer.Start()
EndFunction
