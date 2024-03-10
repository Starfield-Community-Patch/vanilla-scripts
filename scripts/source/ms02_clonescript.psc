ScriptName MS02_CloneScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MS02 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad()
  If MS02.GetStageDone(1920)
    Self.SetEssential(False)
    Self.SetProtected(False)
    Self.KillSilent(None)
  EndIf
EndEvent
