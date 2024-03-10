ScriptName CrewRandomVoiceScript Extends Actor

;-- Variables ---------------------------------------
Bool voiceTypeSet = False

;-- Properties --------------------------------------
Group Autofill
  FormList Property CREW_VoiceTypes_Generic Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function TryToSetCrewVoiceType()
  Bool enabled = Self.IsEnabled()
  Bool loaded = Self.Is3DLoaded()
  If !voiceTypeSet && enabled && loaded
    Self.GoToState("Done")
    voiceTypeSet = True
    VoiceType forcedVoice = Self.SetOverrideVoiceTypeRandom(CREW_VoiceTypes_Generic)
  EndIf
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    Self.TryToSetCrewVoiceType()
  EndEvent
EndState
