ScriptName LC088_KeyJasminesRobotScript Extends ObjectReference
{ Move Jasmine's Robot back to its mark following the cell reset for CF08. Lowest-risk fix for this. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088_Key Auto Const mandatory
Keyword Property LC088_Key_LinkStartMarkerKeyword Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnCellLoad()
    If LC088_Key.IsRunning()
      Self.GotoState("Done")
      Self.MoveTo(Self.GetLinkedRef(LC088_Key_LinkStartMarkerKeyword), 0.0, 0.0, 0.0, True, False)
    EndIf
  EndEvent
EndState
