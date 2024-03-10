ScriptName DefaultTopicInfoModGlobal Extends TopicInfo Const default
{ Modify a Global by specified amount (default 1). Useful for incrementing or decrementing a Global }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Globals
  GlobalVariable Property SetGlobalOnBegin Auto Const
  { Which global to modify when the info starts }
  GlobalVariable Property SetGlobalOnEnd Auto Const
  { Which global to modify when the info starts }
EndGroup

Group Values
  Float Property OnBeginMod = 1.0 Auto Const
  { Default: 1; what value do we modify the global by when the info starts }
  Float Property OnEndMod = 1.0 Auto Const
  { Default: 1; what value do we modify the global by when the info ends }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetGlobalOnBegin
    SetGlobalOnBegin.mod(OnBeginMod)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetGlobalOnEnd
    SetGlobalOnEnd.mod(OnEndMod)
  EndIf
EndEvent
