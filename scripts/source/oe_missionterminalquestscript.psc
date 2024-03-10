ScriptName OE_MissionTerminalQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  LocationAlias Property CurrentMissionTerminalLocation Auto Const mandatory
  ReferenceAlias Property CurrentMissionTerminal Auto Const mandatory
EndGroup

Int Property MissionTerminalObjective = 10 Auto Const

;-- Functions ---------------------------------------

Function PlayerToldAboutMissionTerminal(ObjectReference SpeakerRef)
  Location currentLocation = SpeakerRef.GetCurrentLocation()
  CurrentMissionTerminalLocation.ForceLocationTo(currentLocation)
  CurrentMissionTerminal.ClearAndRefillAlias()
  ObjectReference currentTerminalRef = CurrentMissionTerminal.GetReference()
  If currentTerminalRef
    Self.SetObjectiveActive(MissionTerminalObjective, True)
  Else
    Self.SetObjectiveSkipped(MissionTerminalObjective)
  EndIf
EndFunction

Function PlayerActivateMissionTerminal()
  Self.SetObjectiveCompleted(MissionTerminalObjective, True)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
