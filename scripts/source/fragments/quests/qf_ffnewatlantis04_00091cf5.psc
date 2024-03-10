ScriptName Fragments:Quests:QF_FFNewAtlantis04_00091CF5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ring Auto Const mandatory
ReferenceAlias Property Alias_Thief Auto Const mandatory
Quest Property FFNewAtlantis05 Auto Const mandatory
Quest Property FFNewAtlantis04_SpeechChallengeQuest Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory
ReferenceAlias Property Alias_NPC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FFNewAtlantis04_SpeechChallengeQuest.Start()
EndFunction

Function Fragment_Stage_0004_Item_00()
  FFNewAtlantis04_SpeechChallengeQuest.Start()
  Alias_NPC.ForceRefTo(Alias_Thief.GetRef())
EndFunction

Function Fragment_Stage_0009_Item_00()
  FFNewAtlantis02Misc.SetStage(20)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_Thief.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveSkipped(20)
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_Thief.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().AddItem(Alias_Ring.GetRef() as Form, 1, False)
  Alias_Thief.GetActorRef().EvaluatePackage(False)
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Ring.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Alias_Thief.GetRef().DisableNoWait(False)
  FFNewAtlantis04_SpeechChallengeQuest.Stop()
  FFNewAtlantis05.Start()
  Self.Stop()
EndFunction
