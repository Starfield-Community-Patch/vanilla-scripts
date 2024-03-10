ScriptName DNLocalAlarmTerminalScript Extends TerminalMenu
{ Native terminal script for terminals that control DNLocalAlarmScript alarm systems. }

;-- Variables ---------------------------------------
Int menuItemID_Disarm = 1 Const

;-- Properties --------------------------------------
Keyword Property DNLocalAlarmTerminalLinkKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(DNLocalAlarmTerminalLinkKeyword, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(DNLocalAlarmTerminalLinkKeyword, None)
  If linkedRefChain.Length > 0
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChain as dnlocalalarmscript[])
  EndIf
  If linkedRefChildren.Length > 0
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChildren as dnlocalalarmscript[])
  EndIf
EndEvent

Function HandleMenuItem(Int auiMenuItemID, TerminalMenu akTerminalBase, dnlocalalarmscript[] alarmArray)
  If auiMenuItemID == menuItemID_Disarm
    Int I = 0
    While I < alarmArray.Length
      alarmArray[I].Disarm()
      I += 1
    EndWhile
  EndIf
EndFunction
