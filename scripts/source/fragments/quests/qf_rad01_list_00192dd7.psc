ScriptName Fragments:Quests:QF_Rad01_LIST_00192DD7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Papers Auto Const mandatory
GlobalVariable Property Rad01_RecruitTutorialComplete Auto Const mandatory
Book Property Rad01_Book Auto Const mandatory
Book Property Rad01_Book01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0900_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Papers.TryToEnable()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().additem(Rad01_Book as Form, 1, False)
  Game.GetPlayer().additem(Rad01_Book01 as Form, 1, False)
  Self.SetStage(100)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(190, True, False)
EndFunction

Function Fragment_Stage_0199_Item_00()
  If Self.IsObjectiveDisplayed(190) == False
    Self.SetObjectiveDisplayed(190, True, False)
    Self.SetObjectiveCompleted(190, True)
  EndIf
  If Self.IsObjectiveDisplayed(190) == True
    Self.SetObjectiveCompleted(190, True)
  EndIf
  If Self.IsObjectiveCompleted(100) == False
    Self.SetObjectiveSkipped(100)
  EndIf
  If Self.GetStageDone(299) || Self.GetStageDone(500)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(250, True, False)
EndFunction

Function Fragment_Stage_0299_Item_00()
  Self.SetObjectiveCompleted(250, True)
  Rad01_RecruitTutorialComplete.SetValue(1.0)
  If Self.GetStageDone(199)
    Self.SetStage(900)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveFailed(250, True)
  Rad01_RecruitTutorialComplete.SetValue(1.0)
  If Self.GetStageDone(199)
    Self.SetStage(900)
  EndIf
EndFunction
