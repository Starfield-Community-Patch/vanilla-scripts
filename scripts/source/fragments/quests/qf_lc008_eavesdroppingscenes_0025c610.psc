ScriptName Fragments:Quests:QF_LC008_EavesdroppingScenes_0025C610 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property LC008EavesdroppingScene3 Auto Const mandatory
Scene Property LC008EavesdroppingScene1 Auto Const mandatory
Scene Property LC008EavesdroppingScene2 Auto Const mandatory
Scene Property LC008EavesdroppingScene4 Auto Const mandatory
Scene Property LC008EavesdroppingScene5 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  LC008EavesdroppingScene3.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  LC008EavesdroppingScene1.Start()
  LC008EavesdroppingScene2.Start()
  LC008EavesdroppingScene4.Start()
  LC008EavesdroppingScene5.Start()
EndFunction
