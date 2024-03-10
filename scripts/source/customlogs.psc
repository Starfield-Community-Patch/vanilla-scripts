ScriptName CustomLogs Extends ScriptObject

;-- Structs -----------------------------------------
Struct LogDatum
  String MainLogName
  { Main log to trace to }
  String SubLogName
  { Sub log to trace to }
  Bool PrefixTracesWithLogNames
  { if true, will prefix traces with log names }
  Bool PrefixTracesWithCallingObject
  { if true, will prefix traces with calling object }
  String Prefix
  { prefix to add to all traces (after log names if PrefixTracesWithLogNames == true) }
  Bool ShowNormalTraces
  { ALSO print to standard papyrus.0.log }
EndStruct


;-- Functions ---------------------------------------

Function AddCustomLog(customlogs:logdatum[] ArrayOfLogs, String MainLogName, String SubLogName, Bool PrefixTracesWithLogNames, Bool PrefixTracesWithCallingObject, String Prefix, Bool ShowNormalTraces) Global
  customlogs:logdatum newLog = new customlogs:logdatum
  newLog.MainLogName = MainLogName
  newLog.SubLogName = SubLogName
  newLog.PrefixTracesWithLogNames = PrefixTracesWithLogNames
  newLog.PrefixTracesWithCallingObject = PrefixTracesWithCallingObject
  newLog.Prefix = Prefix
  newLog.ShowNormalTraces = ShowNormalTraces
  ArrayOfLogs.add(newLog, 1)
EndFunction

Function Trace(customlogs:logdatum[] ArrayOfLogs, ScriptObject CallingObject, String asTextToPrint, Int aiSeverity) Global
  Int I = 0
  While I < ArrayOfLogs.Length
    customlogs:logdatum currentLog = ArrayOfLogs[I]
    If currentLog.Prefix != ""
      asTextToPrint = currentLog.Prefix + ": " + asTextToPrint
    EndIf
    Debug.TraceLog(CallingObject, asTextToPrint, currentLog.MainLogName, currentLog.SubLogName, aiSeverity, currentLog.ShowNormalTraces, False, currentLog.PrefixTracesWithLogNames, currentLog.PrefixTracesWithCallingObject)
    I += 1
  EndWhile
EndFunction

Function warning(customlogs:logdatum[] ArrayOfLogs, ScriptObject CallingObject, String asTextToPrint) Global
  Int I = 0
  While I < ArrayOfLogs.Length
    customlogs:logdatum currentLog = ArrayOfLogs[I]
    If currentLog.Prefix != ""
      asTextToPrint = currentLog.Prefix + ": " + asTextToPrint
    EndIf
    Game.warning("WARNING!!! " + asTextToPrint)
    I += 1
  EndWhile
EndFunction
