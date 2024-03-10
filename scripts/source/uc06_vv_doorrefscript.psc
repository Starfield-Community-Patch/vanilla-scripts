ScriptName UC06_VV_DoorRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC06 Auto Const mandatory
{ Quest to watch for unlocking }
Int Property UnlockStage = 99 Auto Const
{ Stage to check on UC06 to ensure the door's always unlocked }
Int Property UnlockStage01 = 105 Auto Const
{ Stage to check on UC06 to ensure the door's always unlocked }
Int Property UnlockStage02 = 200 Auto Const
{ Stage to check on UC06 to ensure the door's always unlocked }

;-- Functions ---------------------------------------

Event OnUnload()
  If Self.GetOpenState() != 3
    Self.SetOpen(False)
  EndIf
EndEvent

Event OnCellLoad()
  If UC06.GetStageDone(UnlockStage) || UC06.GetStageDone(UnlockStage01) || UC06.GetStageDone(UnlockStage02)
    Self.Unlock(False)
  EndIf
EndEvent
