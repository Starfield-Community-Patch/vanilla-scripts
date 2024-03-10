ScriptName Fragments:Scenes:SF_BE_SC04_BargainingScene_002B5664 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property BE_SC04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  If !BE_SC04.GetStageDone(26) && !BE_SC04.GetStageDone(30)
    Self.GetOwningQuest().SetStage(50)
  EndIf
EndFunction
