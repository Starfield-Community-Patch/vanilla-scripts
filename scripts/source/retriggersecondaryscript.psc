ScriptName RETriggerSecondaryScript Extends ObjectReference
{ use for triggers linked to other RETriggers
mainly useful for triggers which use OnTrigger to fire }

;-- Variables ---------------------------------------
String LocalScriptName = "RETriggerSecondaryScript"
retriggerscript myLinkedTrigger

;-- Functions ---------------------------------------

Event OnCellLoad()
  myLinkedTrigger = Self.GetLinkedRef(None) as retriggerscript
  If myLinkedTrigger as Bool && myLinkedTrigger.TriggerOnLoad
    myLinkedTrigger.OnCellLoad()
  EndIf
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  myLinkedTrigger = Self.GetLinkedRef(None) as retriggerscript
  If akActionRef != Game.GetPlayer() as ObjectReference
    Return 
  EndIf
  If myLinkedTrigger as Bool && !myLinkedTrigger.TriggerOnLoad
    myLinkedTrigger.OnTriggerEnter(akActionRef)
  EndIf
EndEvent

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
  If myLinkedTrigger
    myLinkedTrigger.Trace(CallingObject, asTextToPrint, aiSeverity)
  Else
    Debug.Trace((CallingObject as String + " ") + asTextToPrint, aiSeverity)
  EndIf
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint
  If myLinkedTrigger
    myLinkedTrigger.warning(CallingObject, asTextToPrint, False, 2, False, True, True)
  EndIf
EndFunction
