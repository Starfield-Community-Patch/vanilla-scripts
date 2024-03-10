ScriptName RevertToOpenStateOnCellLoad Extends ObjectReference

;-- Variables ---------------------------------------
Float timeOfLastOpenStateChange = -1.0

;-- Properties --------------------------------------
Bool Property ShouldBeOpenOnCellLoad Auto Const
GlobalVariable Property DefaultDaysBeforeDoorsReset Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Utility.GetCurrentGameTime() - timeOfLastOpenStateChange >= DefaultDaysBeforeDoorsReset.GetValue()
    Int currentOpenState = Self.GetOpenState()
    If ShouldBeOpenOnCellLoad
      If currentOpenState != 1 || currentOpenState != 2
        Self.SetOpen(True)
      EndIf
    ElseIf currentOpenState != 3 && currentOpenState != 4
      Self.SetOpen(False)
    EndIf
  EndIf
EndEvent

Event OnOpen(ObjectReference akActionRef)
  Self.SetTimeofLastOpenStateChange()
EndEvent

Event OnClose(ObjectReference akActionRef)
  Self.SetTimeofLastOpenStateChange()
EndEvent

Function SetTimeofLastOpenStateChange()
  timeOfLastOpenStateChange = Utility.GetCurrentGameTime()
EndFunction
