ScriptName Fragments:TopicInfos:TIF_DialogueRedDevilsHQ_0017C658 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR04 Auto Const mandatory
Quest Property UCR04_MiscPointer Auto Const mandatory
Quest Property UCR04_Dupe00 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If UCR04.IsRunning()
    UCR04.SetStage(100)
  ElseIf UCR04_Dupe00.IsRunning()
    UCR04_Dupe00.SetStage(100)
  EndIf
EndFunction
