ScriptName Debug Extends ScriptObject Native hidden

;-- Functions ---------------------------------------

Function AutomatedTestLogDebug(String asMessage) Global Native

Function AutomatedTestLogError(String asMessage) Global Native

Function AutomatedTestLogProgress(String asMessage) Global Native

Function CenterOnCell(String asCellname) Global Native

Float Function CenterOnCellAndWait(String asCellname) Global Native

Function CloseUserLog(String asLogName) Global Native

Function DBSendPlayerPosition() Global Native

Function DumpAliasData(Quest akQuest) Global Native

Function DumpEventRegistrations(ScriptObject akScript) Global Native

Function EnableAI(Bool abEnable) Global Native

Function EnableCollisions(Bool abEnable) Global Native

Function EnableDetection(Bool abEnable) Global Native

Function EnableMenus(Bool abEnable) Global Native

Function ExecuteConsole(String aCommand) Global Native

String Function GetConfigName() Global Native

String Function GetPlatformName() Global Native

String Function GetVersionNumber() Global Native

Function MessageBox(String asMessageBoxText) Global Native

Function Notification(String asNotificationText) Global Native

Bool Function OpenUserLog(String asLogName) Global Native

Float Function PlayerMoveToAndWait(String asDestRef) Global Native

Function QuitGame() Global Native

Function SetFootIK(Bool abFootIK) Global Native

Function SetGodMode(Bool abGodMode) Global Native

Function ShowRefPosition(ObjectReference arRef) Global Native

Function StartScriptProfiling(String asScriptName) Global Native

Function StartStackProfiling() Global Native

Function StartStackRootProfiling(String asScriptName, ScriptObject akObj) Global Native

Function StopScriptProfiling(String asScriptName) Global Native

Function StopStackProfiling() Global Native

Function StopStackRootProfiling(String asScriptName, ScriptObject akObj) Global Native

Function Trace(String asTextToPrint, Int aiSeverity) Global Native

Function TraceFunction(String asTextToPrint, Int aiSeverity) Global Native

Function TraceStack(String asTextToPrint, Int aiSeverity) Global Native

Bool Function TraceUser(String asUserLog, String asTextToPrint, Int aiSeverity) Global Native

Function TraceConditionalGlobal(String TextToPrint, GlobalVariable ShowTrace) Global
{ As TraceConditional() but checks to make sure the global exists to avoid error messages in the log }
  If ShowTrace as Bool && ShowTrace.value as Bool
    Debug.Trace(TextToPrint, 0)
  EndIf
EndFunction

Function TraceConditional(String TextToPrint, Bool ShowTrace, Int Severity) Global
{ As Trace() but takes a second parameter bool ShowTrace (which if false suppresses the message). Used to turn off and on traces that might be otherwise annoying. }
  If ShowTrace
    Debug.Trace(TextToPrint, Severity)
  EndIf
EndFunction

Function TraceAndBox(String asTextToPrint, Int aiSeverity) Global
{ A convenience function to both throw a message box AND write to the trace log, since message boxes sometimes stack in weird ways and won't show up reliably. }
  Debug.MessageBox(asTextToPrint)
  Debug.Trace(asTextToPrint, aiSeverity)
EndFunction

Function TraceSelf(ScriptObject CallingScript, String FunctionName, String StringToTrace) Global
{ Convenient way to trace the script name and optional function name as a prefix to the trace string
Note, always pass in SELF as the CallingScript }
  FunctionName = "-->" + FunctionName + "():"
  Debug.Trace((CallingScript as String + FunctionName) + " " + StringToTrace, 0)
EndFunction

Bool Function TraceLog(ScriptObject CallingObject, String asTextToPrint, String logName, String SubLogName, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames, Bool bPrefixTracesWithCallingObject) Global
  String logNamePrefix = ""
  String subLogNamePrefix = ""
  If bPrefixTraceWithLogNames
    logNamePrefix = logName + ": "
    subLogNamePrefix = SubLogName + ": "
  EndIf
  String callingObjectPrefix = ""
  If bPrefixTracesWithCallingObject
    callingObjectPrefix = CallingObject as String + ": "
  EndIf
  String traceString = logNamePrefix + callingObjectPrefix + asTextToPrint
  If bShowWarning
    traceString = ("WARNING!!! " + CallingObject as String) + ": " + asTextToPrint
  EndIf
  If bShowNormalTrace
    Debug.Trace(traceString, aiSeverity)
  EndIf
  Bool returnVal = False
  Debug.OpenUserLog(logName)
  returnVal = Debug.TraceUser(logName, traceString, aiSeverity)
  If SubLogName != ""
    SubLogName = logName + "_" + SubLogName
    Debug.OpenUserLog(SubLogName)
    returnVal = returnVal && Debug.TraceUser(SubLogName, traceString, aiSeverity)
  EndIf
  Return returnVal
EndFunction
