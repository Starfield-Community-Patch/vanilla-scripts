ScriptName Fragments:Quests:QF_City_NA_Well01_0027071C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
Scene Property City_NA_Well01_003_Stage50Scene Auto Const mandatory
Scene Property City_NA_Well01_005_Stage100Scene Auto Const mandatory
Scene Property City_NA_Well01_007_Stage150Scene Auto Const mandatory
Scene Property City_NA_Well01_009_Stage190Scene Auto Const mandatory
Quest Property City_NA_Well02 Auto Const mandatory
Scene Property JunctionBox01Scene Auto Const
Scene Property JunctionBox02Scene Auto Const
Scene Property JunctionBox03Scene Auto Const
Scene Property JunctionBox04Scene Auto Const
ReferenceAlias Property Alias_LouisaReyez Auto Const mandatory
Quest Property City_NA_GuardPointer_Well Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor01 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor02 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor03 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor04 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor01 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor02 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor03 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor04 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BlockingDoor Auto Const mandatory
GlobalVariable Property StoryManager_NewAtlantisLoad Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().Moveto(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(1)
EndFunction

Function Fragment_Stage_0001_Item_00()
  StoryManager_NewAtlantisLoad.SetValue(1.0)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  City_NA_GuardPointer_Well.SetStage(200)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10)
    Self.SetObjectiveCompleted(10, True)
  EndIf
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_LouisaReyez.GetActorRef().EvaluatePackage(False)
  City_NA_GuardPointer_Well.SetStage(200)
  Alias_BoxDoor01.GetReference().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0030_Item_00()
  JunctionBox01Scene.Start()
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  If JunctionBox01Scene.IsPlaying()
    JunctionBox01Scene.Stop()
    Self.SetObjectiveCompleted(20, True)
  EndIf
  City_NA_Well01_003_Stage50Scene.Start()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
  Alias_BoxDoor02.GetReference().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0080_Item_00()
  JunctionBox02Scene.Start()
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(50, True)
  Self.SetObjectiveDisplayed(90, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If JunctionBox02Scene.IsPlaying()
    JunctionBox02Scene.Stop()
    Self.SetObjectiveCompleted(50, True)
  EndIf
  City_NA_Well01_005_Stage100Scene.Start()
  Self.SetObjectiveCompleted(90, True)
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_BoxDoor03.GetReference().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0130_Item_00()
  JunctionBox03Scene.Start()
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(140, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  If JunctionBox03Scene.IsPlaying()
    JunctionBox03Scene.Stop()
    Self.SetObjectiveCompleted(100, True)
  EndIf
  City_NA_Well01_007_Stage150Scene.Start()
  Self.SetObjectiveCompleted(140, True)
  Self.SetObjectiveDisplayed(150, True, False)
  Alias_BoxDoor04.GetReference().Lock(False, False, True)
  Alias_Puzzle_BoxDoor01.GetReference().Lock(False, False, True)
  Alias_Puzzle_BoxDoor02.GetReference().Lock(False, False, True)
  Alias_Puzzle_BoxDoor03.GetReference().Lock(False, False, True)
  Alias_Puzzle_BoxDoor04.GetReference().Lock(False, False, True)
EndFunction

Function Fragment_Stage_0170_Item_00()
  JunctionBox04Scene.Start()
EndFunction

Function Fragment_Stage_0175_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(180, True, False)
EndFunction

Function Fragment_Stage_0185_Item_00()
  Alias_Puzzle_BlockingDoor.GetReference().Lock(False, False, True)
  Alias_Puzzle_BlockingDoor.GetReference().SetOpen(True)
EndFunction

Function Fragment_Stage_0190_Item_00()
  If JunctionBox04Scene.IsPlaying()
    JunctionBox04Scene.Stop()
    Self.SetObjectiveCompleted(150, True)
  EndIf
  City_NA_Well01_009_Stage190Scene.Start()
  Self.SetObjectiveCompleted(180, True)
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  City_NA_Well02.Start()
  Self.Stop()
EndFunction
