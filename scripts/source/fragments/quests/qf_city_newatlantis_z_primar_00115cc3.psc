ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Primar_00115CC3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property ReliableCare Auto Const
Quest Property SuspiciousActivities Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
  Self.SetObjectiveDisplayed(40, True, False)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  If Self.GetStageDone(60) == True && Self.GetStageDone(80) == True
    Self.SetStage(110)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  SuspiciousActivities.SetStage(0)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0045_Item_00()
  SuspiciousActivities.SetStage(1)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(40, True)
  If Self.GetStageDone(30) == True && Self.GetStageDone(80) == True
    Self.SetStage(110)
  EndIf
EndFunction

Function Fragment_Stage_0070_Item_00()
  ReliableCare.SetStage(10)
  Self.SetStage(60)
EndFunction

Function Fragment_Stage_0075_Item_00()
  ReliableCare.SetStage(1)
  Self.SetStage(60)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(60, True)
  If Self.GetStageDone(30) == True && Self.GetStageDone(60) == True
    Self.SetStage(110)
  EndIf
  Self.SetStage(90)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetStage(80)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(80, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
