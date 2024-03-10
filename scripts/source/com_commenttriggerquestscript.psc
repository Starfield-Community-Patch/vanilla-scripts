ScriptName COM_CommentTriggerQuestScript Extends Quest
{ Used to handle scene driven AffinityEvent sending initiaited by COM_CommentTriggerScript }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property CommentScene Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
ReferenceAlias Property Alias_CommentTrigger Auto Const mandatory
ReferenceAlias Property Alias_Target Auto Const mandatory

;-- Functions ---------------------------------------

Function SendAffinityEvent()
  companionactorscript CompanionRef = Alias_Companion.GetActorReference() as companionactorscript
  com_commenttriggerscript CommentTriggerRef = Alias_CommentTrigger.GetReference() as com_commenttriggerscript
  ObjectReference TargetRef = Alias_Target.GetReference()
  If CommentTriggerRef as Bool && CompanionRef as Bool
    CommentTriggerRef.SendAffinityEvent(CompanionRef, TargetRef)
  EndIf
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
