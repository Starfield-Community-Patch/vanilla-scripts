ScriptName Fragments:Quests:QF_FFCydoniaR02_00224FE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaR02_EquipmentCount Auto Const mandatory
Weapon Property Eon Auto Const mandatory
GlobalVariable Property FFCydoniaR02_NumTimesCompleted Auto Const mandatory
Quest Property AspirationalItems Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(150, True, False)
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(100)
    Self.SetObjectiveCompleted(100, True)
    Self.SetObjectiveDisplayed(200, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  If FFCydoniaR02_NumTimesCompleted.GetValue() < 1.0
    AspirationalItems.SetStage(100)
  EndIf
  FFCydoniaR02_NumTimesCompleted.Mod(1.0)
  Self.Stop()
EndFunction
