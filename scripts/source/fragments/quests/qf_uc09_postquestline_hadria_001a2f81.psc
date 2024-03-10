ScriptName Fragments:Quests:QF_UC09_PostQuestline_Hadria_001A2F81 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property HadrianWrapUpComplete Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0110_Item_00()
  HadrianWrapUpComplete.SetValue(1.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  HadrianWrapUpComplete.SetValue(1.0)
  Self.Stop()
EndFunction
