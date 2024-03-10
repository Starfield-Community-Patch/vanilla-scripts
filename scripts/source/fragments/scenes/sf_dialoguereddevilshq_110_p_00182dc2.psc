ScriptName Fragments:Scenes:SF_DialogueRedDevilsHQ_110_P_00182DC2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest()
  If OQ.GetStageDone(405) || OQ.GetStageDone(410) || OQ.GetStageDone(415)
    OQ.SetStage(400)
  EndIf
EndFunction
