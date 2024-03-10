ScriptName Fragments:Scenes:SF_UC_CY_HeatleechScene_Scen_0018B2B2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest()
  OQ.SetStage(210)
  OQ.SetStage(250)
EndFunction
