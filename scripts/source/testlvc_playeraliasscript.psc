ScriptName TestLVC_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TESTLVC_ScanPercentTestMessage Auto Const mandatory
{ Message used to display scan percentage }
GlobalVariable Property TestLVC_EnableScanningPercentDisplay Auto Const mandatory
{ Global used to manage the display of the scanned percentage of the current actor on screen }

;-- Functions ---------------------------------------

Event OnPlayerScannedObject(ObjectReference akScannedRef)
  If TestLVC_EnableScanningPercentDisplay.GetValue() >= 1.0
    Float fPercentScanned = 0.0
    TESTLVC_ScanPercentTestMessage.Show(fPercentScanned, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    ActorBase[] currBiomeActors = None
    ActorBase[] currBiomeFlora = None
    Int I = 0
    Int iLength = currBiomeActors.Length
    While I < iLength
      ActorBase currBase = currBiomeActors[I]
      I += 1
    EndWhile
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
