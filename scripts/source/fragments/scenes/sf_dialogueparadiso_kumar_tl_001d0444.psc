ScriptName Fragments:Scenes:SF_DialogueParadiso_Kumar_TL_001D0444 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFParadisoZ03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  If FFParadisoZ03.IsCompleted()
    Self.GetOwningQuest().SetStage(1303)
  EndIf
EndFunction
