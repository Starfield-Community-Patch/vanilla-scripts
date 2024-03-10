ScriptName CompanionAffinityScript Extends Actor

;-- Structs -----------------------------------------
Struct AngerEvent
  affinityevent EventCausingAnger
  GlobalVariable AngerLevel
  { filter for: COM_AngerLevel }
  GlobalVariable AngerReason
  { filter for: COM_AngerReason }
EndStruct


;-- Variables ---------------------------------------
com_companionquestscript COM_CompanionQuest

;-- Properties --------------------------------------
Group Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
EndGroup

Group Properties
  companionaffinityscript:angerevent[] Property AngerEventData Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  COM_CompanionQuest = ((Self as Actor) as companionactorscript).COM_CompanionQuest
EndEvent

Event OnAffinityEvent(affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  companionaffinityscript:angerevent[] angerTriggeringEvents = AngerEventData.GetMatchingStructs("EventCausingAnger", akAffinityEvent, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs 
  If angerTriggeringEvents.Length > 0
    companionaffinityscript:angerevent angerTriggeringEvent = angerTriggeringEvents[0]
    COM_CompanionQuest.SetAngerLevel(angerTriggeringEvent.AngerLevel, angerTriggeringEvent.AngerReason)
  EndIf
  SQ_Companions.SQ_Traits.HandleAffinityEvent(Self as Actor, akAffinityEvent, akActorValue, akReactionValue, akTarget)
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
