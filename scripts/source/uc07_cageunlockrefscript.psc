ScriptName UC07_CageUnlockRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC07 Auto Const mandatory
{ Relevant UC quest }
Quest Property Dialogue1OfAKindUC07 Auto Const mandatory
{ Quest used to manage the open/close state of Unit 99's gate }
Int Property StageToSet = 190 Auto Const
{ Stage to set when this gate is unlocked }
Int Property PrereqStage = 302 Auto Const
{ Only care about these changes once this stage is set (and Unit 99 is turned on) }

;-- Functions ---------------------------------------

Event OnLockStateChanged()
  If UC07.GetStageDone(PrereqStage) && !Self.IsLocked() && !Dialogue1OfAKindUC07.GetStageDone(StageToSet)
    Dialogue1OfAKindUC07.SetStage(StageToSet)
    Int currOpenState = Self.GetOpenState()
    If currOpenState == 3 || currOpenState == 4
      Self.SetOpen(True)
    EndIf
  EndIf
EndEvent
