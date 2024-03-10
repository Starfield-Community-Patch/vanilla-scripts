ScriptName Temp_FixExistingSaves_CompanionCrime Extends Actor

;-- Variables ---------------------------------------
Bool Done

;-- Properties --------------------------------------
Faction Property PersonalCrimeFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  If Done == False
    ((Self as Actor) as companioncrimeresponsescript).RegisterForEvents()
    Self.SetValue(Game.GetAggressionAV(), 1.0)
    Self.SetCrimeFaction(PersonalCrimeFaction)
    Done = True
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
