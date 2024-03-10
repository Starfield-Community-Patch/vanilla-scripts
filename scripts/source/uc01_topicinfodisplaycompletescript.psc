ScriptName UC01_TopicInfoDisplayCompleteScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
Int Property PrereqStage = 200 Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If UC01.IsRunning() && UC01.GetStageDone(PrereqStage)
    (UC01 as uc01questscript).DisplaySceneComplete(akSpeakerRef)
  EndIf
EndEvent
