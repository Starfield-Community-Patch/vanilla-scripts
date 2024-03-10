ScriptName Fragments:Scenes:SF_UC06_430_OrlaseBoardingSc_00215DBD Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest pQuest = Self.GetOwningQuest()
  pQuest.SetStage(440)
  pQuest.SetStage(441)
EndFunction
