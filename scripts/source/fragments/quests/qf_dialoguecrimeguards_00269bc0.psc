ScriptName Fragments:Quests:QF_DialogueCrimeGuards_00269BC0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC05_PlayerCaughtSnoopingFSE Auto Const mandatory
Quest Property RI04 Auto Const mandatory
Quest Property LC044 Auto Const
Quest Property CF01 Auto Const mandatory
GlobalVariable Property CrimeBribeAmount Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CrimeAllowBribePlayerCreditsRequired Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
GlobalVariable Property CrimeBountyAmount Auto Const mandatory

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

Function Fragment_Stage_0310_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  Game.GetPlayer().RemoveItem(Credits as Form, CrimeBribeAmount.GetValueInt(), False, None)
  kmyQuest.PlayerPayFine(False, True)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerPayFine(False, True)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerPayFine(True, False)
EndFunction

Function Fragment_Stage_0360_Item_00()
  Quest __temp = Self as Quest
  dialoguecrimeguardsquestscript kmyQuest = __temp as dialoguecrimeguardsquestscript
  kmyQuest.PlayerPayFine(False, False)
EndFunction

Function Fragment_Stage_0499_Item_00()
  If UC05_PlayerCaughtSnoopingFSE.GetValue() < 1.0
    UC05_PlayerCaughtSnoopingFSE.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  cf01dialoguecrimeguardsscript kmyQuest = __temp as cf01dialoguecrimeguardsscript
  kmyQuest.DisablePlayerControlsForCF01Arrest()
  CF01.SetStage(110)
EndFunction

Function Fragment_Stage_0705_Item_00()
  Game.GetPlayer().StopCombatAlarm()
  Alias_Guard.GetActorRef().EvaluatePackage(True)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  lc044dialoguecrimeguardsscript kmyQuest = __temp as lc044dialoguecrimeguardsscript
  kmyQuest.PlayerWinSpeechChallenge()
  RI04.SetStage(470)
  LC044.SetStage(15)
EndFunction

Function Fragment_Stage_0810_Item_00()
  Quest __temp = Self as Quest
  lc044dialoguecrimeguardsscript kmyQuest = __temp as lc044dialoguecrimeguardsscript
  LC044.SetStage(13)
  kmyQuest.PlayerGoToDetention()
EndFunction
