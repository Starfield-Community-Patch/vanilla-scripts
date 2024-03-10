ScriptName Fragments:Scenes:SF_DialogueEleosRetreat_TL_H_000D879E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest()
  If OQ.GetStageDone(1350) || OQ.GetStageDone(1351) || OQ.GetStageDone(1352) || OQ.GetStageDone(1353) || OQ.GetStageDone(1354)
    OQ.SetStage(1355)
  EndIf
EndFunction
