ScriptName Fragments:Quests:QF_MS05Intro_00299E7A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const
Quest Property MQ102 Auto Const
Quest Property MQ105 Auto Const
ObjectReference Property MS05StartMarker Auto Const
ReferenceAlias Property Alias_WalterStroud Auto Const mandatory
Quest Property DialogueUCTheLodge Auto Const mandatory
Quest Property MS05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101.SetStage(1800)
  MQ102.CompleteQuest()
  DialogueUCTheLodge.SetStage(20)
  Game.GetPlayer().MoveTo(Alias_WalterStroud.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  MS05.Start()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
