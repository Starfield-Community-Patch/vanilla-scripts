ScriptName Fragments:Quests:QF_City_NA_Viewport03_0027071A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
Faction Property City_NA_Viewport03_GangFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_Fizz Auto Const mandatory
Quest Property City_NA_Viewport01 Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
ReferenceAlias Property Alias_BackupActor01 Auto Const mandatory
ReferenceAlias Property Alias_BackupActor02 Auto Const mandatory
ReferenceAlias Property Alias_Sub12Door Auto Const mandatory
ReferenceAlias Property Alias_SashaAlessio Auto Const mandatory
Scene Property City_NA_Viewport03_003B_Fizz_PreScene Auto Const mandatory
GlobalVariable Property City_NA_Viewport02_Location Auto Const mandatory
Quest Property City_NA_Viewport03_PostQuest Auto Const mandatory
ReferenceAlias Property Alias_StateChangeMarker Auto Const mandatory
Quest Property City_NA_Viewport03_SpeechChallenges Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  City_NA_Viewport01.SetStage(1000)
  City_NA_Viewport02.SetStage(200)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Fizz.GetReference().Enable(False)
  Alias_SashaAlessio.GetReference().Enable(False)
  City_NA_Viewport03_SpeechChallenges.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetStage(15)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_Sub12Door.GetReference().Lock(False, False, True)
  Alias_SashaAlessio.GetReference().Enable(False)
  Alias_SashaAlessio.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10)
    Self.SetObjectiveCompleted(10, True)
  EndIf
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(30, True, False)
  If Self.GetStageDone(15) == False
    Self.SetStage(15)
  EndIf
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  If Self.IsObjectiveDisplayed(30)
    Self.SetObjectiveDisplayed(30, False, False)
  EndIf
  If Self.IsObjectiveDisplayed(20)
    Self.SetObjectiveCompleted(20, True)
  EndIf
  If Self.IsObjectiveDisplayed(40)
    Self.SetObjectiveCompleted(40, True)
  EndIf
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True)
  City_NA_Viewport03_003B_Fizz_PreScene.Start()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0111_Item_00()
  City_NA_Viewport03_GangFaction.SetEnemy(PlayerFaction, False, False)
  Alias_Fizz.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0119_Item_00()
  Self.SetStage(110)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(180)
EndFunction

Function Fragment_Stage_0121_Item_00()
  Alias_Fizz.GetActorReference().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetStage(180)
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  If City_NA_Viewport02.GetStageDone(130)
    City_NA_Viewport02_Location.SetValue(1.0)
  ElseIf City_NA_Viewport02.GetStageDone(140)
    City_NA_Viewport02_Location.SetValue(2.0)
  ElseIf City_NA_Viewport02.GetStageDone(150)
    City_NA_Viewport02_Location.SetValue(3.0)
  EndIf
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_StateChangeMarker.GetReference().Enable(False)
  City_NA_Viewport03_PostQuest.Start()
  Self.Stop()
EndFunction
