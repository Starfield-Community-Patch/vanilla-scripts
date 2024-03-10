ScriptName UC07_BatteryContainerCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UC07_BatteryComponent Auto Const mandatory
{ Keyword used to designate this is one of the quest item battery components }
Int Property PrereqStage = 105 Auto Const
{ Prereq stage used to know it's okay to start tracking container changed events }

;-- Functions ---------------------------------------

Event OnQuickContainerOpened(ObjectReference akSenderRef)
  If Self.GetOwningQuest().GetStageDone(PrereqStage)
    If akSenderRef.GetItemCount(UC07_BatteryComponent as Form) <= 0
      Self.RemoveRef(akSenderRef)
    EndIf
  EndIf
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If Self.GetOwningQuest().GetStageDone(PrereqStage)
    If akSenderRef.GetItemCount(UC07_BatteryComponent as Form) <= 0
      Self.RemoveRef(akSenderRef)
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
