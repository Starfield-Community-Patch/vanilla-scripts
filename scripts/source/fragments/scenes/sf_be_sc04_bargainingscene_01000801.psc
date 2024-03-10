ScriptName Fragments:Scenes:SF_BE_SC04_BargainingScene_01000801 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  If Self.GetOwningQuest().GetStage() != 30
    Self.GetOwningQuest().SetStage(50)
  EndIf
EndFunction
