ScriptName UC03_SpaceportGuardRefColl Extends RefCollectionAlias

;-- Functions ---------------------------------------

Function MarkCollectionIgnoreFriendlyHits(RefCollectionAlias akTargetCollection, Bool bIgnore)
  Int I = 0
  Int iCount = akTargetCollection.GetCount()
  While I < iCount
    ObjectReference currObj = akTargetCollection.GetAt(I)
    currObj.IgnoreFriendlyHits(bIgnore)
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
