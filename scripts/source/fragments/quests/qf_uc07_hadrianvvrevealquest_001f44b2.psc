ScriptName Fragments:Quests:QF_UC07_HadrianVVRevealQuest_001F44B2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC07_HadrianKnowsVVLives Auto Const mandatory
Quest Property UC07 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0140_Item_00()
  UC07_HadrianKnowsVVLives.SetValue(1.0)
EndFunction

Function Fragment_Stage_0199_Item_00()
  Self.SetStage(200)
  UC07.SetStage(300)
EndFunction

Function Fragment_Stage_0200_Item_00()
  If UC07.IsRunning() && !UC07.GetStageDone(200) && !UC07.GetStageDone(300)
    UC07.SetStage(200)
  EndIf
  Self.Stop()
EndFunction
