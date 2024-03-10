ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D28A1 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS03_Outcome Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  MS03_Outcome.SetValue(3.0)
EndFunction
