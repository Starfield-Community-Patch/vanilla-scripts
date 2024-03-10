ScriptName UC09QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias[] Property CabinetNPCAliases Auto Const mandatory
{ Array of Cabinet NPC aliases we use to get everyone in place for the big conversation }
ReferenceAlias Property EmergencyRecording Auto
{ Holding alias for the emergency recording the player uses in the Cabinet scene }

;-- Functions ---------------------------------------

Function GetNPCsInPlace()
  Int I = 0
  Int iLength = CabinetNPCAliases.Length
  While I < iLength
    Actor currACT = CabinetNPCAliases[I].GetActorRef()
    If currACT
      currACT.EvaluatePackage(False)
      currACT.MoveToPackageLocation()
    EndIf
    I += 1
  EndWhile
EndFunction

Function StaggeredEvalPackages()
  Int I = 0
  Int iLength = CabinetNPCAliases.Length
  Float minwait = 0.200000003
  Float maxwait = 0.400000006
  While I < iLength
    Float fRand = Utility.RandomFloat(minwait, maxwait)
    Actor currACT = CabinetNPCAliases[I].GetActorRef()
    Utility.Wait(fRand)
    currACT.EvaluatePackage(False)
    I += 1
  EndWhile
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
