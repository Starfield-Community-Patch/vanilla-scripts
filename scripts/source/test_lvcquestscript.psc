ScriptName TEST_LVCQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property DistanceTestMarker Auto Const mandatory
{ Marker used for the multiple distance tests }
wwiseevent Property WwiseEvent_AMBArtifactPuzzleRingA_Success Auto Const mandatory
{ Sounds used for the furthest distance event }
wwiseevent Property WwiseEvent_AMBArtifactPuzzleRingB_Success Auto Const mandatory
{ Sounds used for the middle distance event }
wwiseevent Property WwiseEvent_AMBArtifactPuzzleRingC_Success Auto Const mandatory
{ Sounds used for the closest distance event }
inputenablelayer Property TestEnableLayer Auto
{ Enable player used for testing }

;-- Functions ---------------------------------------

Function RegisterForDistanceTestEvents()
  ObjectReference myRef = DistanceTestMarker.GetRef()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  Self.RegisterForDistanceLessThanEvent(PlayerRef as ScriptObject, myRef as ScriptObject, 20.0, 0)
  Self.RegisterForDistanceLessThanEvent(PlayerRef as ScriptObject, myRef as ScriptObject, 15.0, 1)
  Self.RegisterForDistanceLessThanEvent(PlayerRef as ScriptObject, myRef as ScriptObject, 10.0, 2)
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  ObjectReference myRef = DistanceTestMarker.GetRef()
  If akObj1 == myRef || akObj2 == myRef
    If aiEventID == 0
      WwiseEvent_AMBArtifactPuzzleRingA_Success.Play(myRef, None, None)
    ElseIf aiEventID == 1
      WwiseEvent_AMBArtifactPuzzleRingB_Success.Play(myRef, None, None)
    ElseIf aiEventID == 2
      WwiseEvent_AMBArtifactPuzzleRingC_Success.Play(myRef, None, None)
    EndIf
  EndIf
EndEvent

Function DEBUGPrintBiomeActorBase(Actor akTargetCreature)
  ActorBase TargetBase = None
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
