ScriptName SQ_PreventRecalcScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Refs Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Function AddRef(ObjectReference RefToAdd)
  If Self.IsRunning() == False
    Self.Start()
  EndIf
  Refs.AddRef(RefToAdd)
EndFunction

Function RemoveRef(ObjectReference RefToRemove)
  Refs.RemoveRef(RefToRemove)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
