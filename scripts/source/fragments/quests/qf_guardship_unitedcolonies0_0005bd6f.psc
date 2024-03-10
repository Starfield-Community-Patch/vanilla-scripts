ScriptName Fragments:Quests:QF_GuardShip_UnitedColonies0_0005BD6F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerTryToArrest()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerResistingArrest()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerGoToJail()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerPayFine(True, True)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerPayFine(True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerPayFine(False, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Game.GetPlayer().StopCombatAlarm()
  CF01.SetStage(110)
EndFunction
