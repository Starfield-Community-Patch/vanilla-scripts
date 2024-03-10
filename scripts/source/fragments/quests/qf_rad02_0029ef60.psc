ScriptName Fragments:Quests:QF_RAD02_0029EF60 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NadiaMuffaz Auto Const mandatory
ReferenceAlias Property Alias_TommyBitlow Auto Const mandatory
GlobalVariable Property RAD02_InterviewCount Auto Const mandatory
Scene Property RAD02_0010_TommyWave Auto Const mandatory
Quest Property City_NewAtlantis_Z_PrimarySources Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor aTarg = Alias_NadiaMuffaz.GetActorRef()
  Game.GetPlayer().MoveTo(aTarg as ObjectReference, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0005_Item_00()
  If !Self.GetStageDone(50)
    Alias_TommyBitlow.GetRef().Enable(False)
    Alias_TommyBitlow.GetActorRef().EvaluatePackage(False)
  EndIf
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_TommyBitlow.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(25, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(50, True, False)
  If Self.GetStageDone(100)
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
  If Self.GetStageDone(200)
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
  If Self.GetStageDone(300)
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
  If Self.GetStageDone(400)
    Self.SetObjectiveDisplayed(400, True, False)
  EndIf
  If Self.GetStageDone(500)
    Self.SetObjectiveDisplayed(500, True, False)
  EndIf
  If Self.GetStageDone(600) || Self.GetStageDone(700)
    Self.SetObjectiveDisplayed(600, True, False)
  EndIf
  City_NewAtlantis_Z_PrimarySources.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(100, True, False)
  Else
    Self.SetStage(5)
  EndIf
EndFunction

Function Fragment_Stage_0199_Item_00()
  Self.SetObjectiveCompleted(100, True)
  RAD02_InterviewCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0299_Item_00()
  Quest __temp = Self as Quest
  rad02script kmyQuest = __temp as rad02script
  Self.SetObjectiveCompleted(200, True)
  kmyQuest.StoryCheck()
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(300, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0399_Item_00()
  Quest __temp = Self as Quest
  rad02script kmyQuest = __temp as rad02script
  Self.SetObjectiveCompleted(300, True)
  kmyQuest.StoryCheck()
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(400, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0499_Item_00()
  Quest __temp = Self as Quest
  rad02script kmyQuest = __temp as rad02script
  Self.SetObjectiveCompleted(400, True)
  kmyQuest.StoryCheck()
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(500, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0505_Item_00()
  If !Self.GetStageDone(500)
    RAD02_InterviewCount.Mod(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0599_Item_00()
  Quest __temp = Self as Quest
  rad02script kmyQuest = __temp as rad02script
  Self.SetObjectiveCompleted(500, True)
  kmyQuest.StoryCheck()
EndFunction

Function Fragment_Stage_0600_Item_00()
  If Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(600, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0699_Item_00()
  Quest __temp = Self as Quest
  rad02script kmyQuest = __temp as rad02script
  Self.SetObjectiveCompleted(600, True)
  kmyQuest.StoryCheck()
EndFunction

Function Fragment_Stage_0700_Item_00()
  If Self.GetStageDone(50)
    Self.SetObjectiveDisplayed(600, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0799_Item_00()
  Quest __temp = Self as Quest
  rad02script kmyQuest = __temp as rad02script
  Self.SetObjectiveCompleted(600, True)
  kmyQuest.StoryCheck()
EndFunction

Function Fragment_Stage_8000_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(8000, True, False)
EndFunction

Function Fragment_Stage_8100_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
