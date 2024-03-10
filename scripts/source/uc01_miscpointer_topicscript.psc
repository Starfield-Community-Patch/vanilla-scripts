ScriptName UC01_MiscPointer_TopicScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
{ Quest form for UC01 }
Quest Property UC_Tuala_Misc Auto Const mandatory
{ Quest form for the UC01 misc quest }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If !UC01.GetStageDone(100) && !UC_Tuala_Misc.GetStageDone(100)
    UC_Tuala_Misc.SetStage(100)
  EndIf
EndEvent
