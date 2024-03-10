ScriptName Fragments:Quests:QF_FFNeonZ08_00063F4C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueQuestNeon Auto Const
ReferenceAlias Property Alias_HeadlockMarker Auto Const mandatory
ReferenceAlias Property Alias_Headlock Auto Const mandatory
Faction Property HeadlockEnemyFaction Auto Const
GlobalVariable Property TLTimer Auto Const
GlobalVariable Property DaysPassed Auto Const
RefCollectionAlias Property Alias_HeadlockGang Auto Const mandatory
Quest Property FFNeonGuardPointer_Z08 Auto Const mandatory
ReferenceAlias Property Alias_Thug Auto Const mandatory
ReferenceAlias Property Alias_ThugCOPY001 Auto Const mandatory
ReferenceAlias Property Alias_ThugCOPY002 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  FFNeonGuardPointer_Z08.SetStage(200)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetObjectiveDisplayed(14, True, False)
EndFunction

Function Fragment_Stage_0018_Item_00()
  If Self.IsObjectiveDisplayed(14)
    Self.SetObjectiveCompleted(14, True)
  EndIf
  If Self.GetStageDone(13)
    Self.SetObjectiveDisplayed(14, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_HeadlockMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0028_Item_00()
  Game.GetPlayer().AddToFaction(HeadlockEnemyFaction)
  Alias_Headlock.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0)
  Alias_Headlock.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  Alias_Thug.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0)
  Alias_Thug.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  Alias_ThugCOPY001.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0)
  Alias_ThugCOPY001.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  Alias_ThugCOPY002.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0)
  Alias_ThugCOPY002.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  DialogueQuestNeon.SetStage(480)
  TLTimer.setvalue(DaysPassed.GetValue() + 1.0)
  Alias_HeadlockMarker.GetRef().Disable(False)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
