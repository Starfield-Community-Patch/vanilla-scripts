ScriptName Fragments:Scenes:SF_DialogueEleosRetreat_TL_S_0027898D Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest()
  If !OQ.GetStageDone(910) && (OQ.GetStageDone(905) || OQ.GetStageDone(906))
    OQ.SetStage(910)
  EndIf
EndFunction
