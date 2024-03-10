ScriptName UC03_AliasMoveRefOnUnload Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage01 = 500 Auto Const
{ Don't attempt to move the NPC until this stage has been set }
Int Property ShutdownStage01 = 505 Auto Const
{ Once this teleport has happened, set this stage so it doesn't happen again }
ObjectReference Property TeleportMarker01 Auto Const mandatory
{ The marker to which the ref should be teleported once she unloads }
Int Property PrereqStage02 = 100 Auto Const
{ Don't attempt to move the NPC until this stage has been set }
Int Property ShutdownStage02 = 105 Auto Const
{ Once this teleport has happened, set this stage so it doesn't happen again }
ObjectReference Property TeleportMarker02 Auto Const mandatory
{ The marker to which the ref should be teleported once she unloads }
Int Property PrereqStage03 = 350 Auto Const
{ Don't attempt to move the NPC until this stage has been set }
Int Property ShutdownStage03 = 355 Auto Const
{ Once this teleport has happened, set this stage so it doesn't happen again }
ObjectReference Property TeleportMarker03 Auto Const mandatory
{ The marker to which the ref should be teleported once she unloads }

;-- Functions ---------------------------------------

Event OnUnload()
  ObjectReference myRef = Self.GetRef()
  Quest OQ = Self.GetOwningQuest()
  If !OQ.GetStageDone(ShutdownStage01) && OQ.GetStageDone(PrereqStage01)
    OQ.SetStage(ShutdownStage01)
    myRef.MoveTo(TeleportMarker01, 0.0, 0.0, 0.0, True, False)
  ElseIf !OQ.GetStageDone(ShutdownStage02) && OQ.GetStageDone(PrereqStage02)
    OQ.SetStage(ShutdownStage02)
    myRef.MoveTo(TeleportMarker02, 0.0, 0.0, 0.0, True, False)
  ElseIf !OQ.GetStageDone(ShutdownStage03) && OQ.GetStageDone(PrereqStage03)
    OQ.SetStage(ShutdownStage03)
    myRef.MoveTo(TeleportMarker03, 0.0, 0.0, 0.0, True, False)
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
