ScriptName COM_CommitmentGiftScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CommitmentGiftEnabled Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  Actor PlayerRef = Game.GetPlayer()
  If akNewContainer == PlayerRef as ObjectReference
    CommitmentGiftEnabled.SetValue(1.0)
  EndIf
  If akOldContainer == PlayerRef as ObjectReference
    (SQ_Companions as sq_companionsscript).CommitmentGifts.RemoveRef(Self as ObjectReference)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
