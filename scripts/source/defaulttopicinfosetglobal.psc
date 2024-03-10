ScriptName DefaultTopicInfoSetGlobal Extends TopicInfo Const default
{ Sets a global to a specified value (default 1) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Globals
  GlobalVariable Property SetGlobalOnBegin Auto Const
  { Which global to set when the info starts }
  GlobalVariable Property SetGlobalOnEnd Auto Const
  { Which global to set when the info starts }
EndGroup

Group Values
  Float Property OnBeginValue = 1.0 Auto Const
  { Default: 1; what value do we set the global to when the info starts }
  Float Property OnEndValue = 1.0 Auto Const
  { Default: 1; what value do we set the global to when the info ends }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetGlobalOnBegin
    SetGlobalOnBegin.setValue(OnBeginValue)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetGlobalOnEnd
    SetGlobalOnEnd.setValue(OnEndValue)
  EndIf
EndEvent
