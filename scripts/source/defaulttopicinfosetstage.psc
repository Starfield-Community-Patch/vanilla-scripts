ScriptName DefaultTopicInfoSetStage Extends DefaultTopicInfo Const default
{ Default script for setting a different quest's stage from a topic info. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property SetStageOnEnd = True Auto Const
  { If true (default), set stage on end. If false, set stage on begin. }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If !SetStageOnEnd
    Self.TryToSetStage()
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetStageOnEnd
    Self.TryToSetStage()
  EndIf
EndEvent
