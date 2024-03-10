ScriptName COM_IncrementFlirtTopicScript Extends TopicInfo
{ Increments a companion's COM_FlirtCount actorvalu
***IMPORTANT!!!*** Attach to the line a companion responds with after the player choses an "Flirt" dialogue choice.
This only works on an info in which the SPEAKER is a companion }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  companionactorscript companionRef = akSpeakerRef as companionactorscript
  If companionRef
    companionRef.SQ_Companions.IncrementFlirtCount(companionRef)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
