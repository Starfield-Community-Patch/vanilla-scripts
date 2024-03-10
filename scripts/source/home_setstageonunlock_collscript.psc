ScriptName Home_SetStageOnUnlock_CollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CompletionStage = 1000 Auto Const
{ Stage to set when any door to this home has been unlocked }
Bool Property WatchForLockStateChange = True Auto Const
{ If TRUE, this quest will complete when any of the home's doors unlock.
If FALSE, this quest will complete when any of the doors are activated by the player }

;-- Functions ---------------------------------------

Event OnLockStateChanged(ObjectReference akSenderRef)
  If WatchForLockStateChange
    If !akSenderRef.IsLocked()
      Self.GetOwningQuest().SetStage(CompletionStage)
    EndIf
  EndIf
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If !WatchForLockStateChange
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.GetOwningQuest().SetStage(CompletionStage)
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
