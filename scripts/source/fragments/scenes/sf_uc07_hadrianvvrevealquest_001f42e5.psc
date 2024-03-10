ScriptName Fragments:Scenes:SF_UC07_HadrianVVRevealQuest_001F42E5 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest myOQ = Self.GetOwningQuest()
  If myOQ.GetStageDone(140) && !myOQ.GetStageDone(145) && !UC08.GetStageDone(629)
    myOQ.SetStage(200)
  EndIf
EndFunction
