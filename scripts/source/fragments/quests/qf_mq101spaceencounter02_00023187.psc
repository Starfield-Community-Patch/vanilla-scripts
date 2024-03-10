ScriptName Fragments:Quests:QF_MQ101SpaceEncounter02_00023187 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(20)
    Self.SetStage(100)
  EndIf
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.GetStageDone(10)
    Self.SetStage(100)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ101.SetStage(500)
EndFunction
