ScriptName Fragments:Scenes:SF_UC05_310_RadcliffMain_Red_0024F838 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  Quest OQ = Self.GetOwningQuest()
  If OQ.GetStageDone(315) && !OQ.GetStageDone(349)
    OQ.SetStage(317)
  EndIf
EndFunction
