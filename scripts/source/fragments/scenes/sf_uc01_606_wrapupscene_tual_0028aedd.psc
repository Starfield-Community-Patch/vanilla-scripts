ScriptName Fragments:Scenes:SF_UC01_606_WrapupScene_Tual_0028AEDD Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(691)
    myQuest.SetStage(692)
  EndIf
EndFunction
