ScriptName NativeTerminal:AlarmScript Extends TerminalMenu
{ handles alarms via native terminal }

;-- Variables ---------------------------------------
Bool anyEnabled = False
Bool anyOn = False

;-- Properties --------------------------------------
Group autofillProperties
  ActorValue Property NativeTerminalAlarm_AnyOn Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalAlarm_AnyEnabled Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalAlarm Auto Const mandatory
Int Property menuItemID_TurnOn = 1 Auto Const
Int Property menuItemID_TurnOff = 2 Auto Const
Int Property menuItemID_Disable = 3 Auto Const
Int Property menuItemID_Enable = 4 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef)
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  sq_alarmactivatorscript[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalAlarm, 100) as sq_alarmactivatorscript[]
  sq_alarmactivatorscript[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalAlarm, None) as sq_alarmactivatorscript[]
  anyOn = False
  anyEnabled = False
  If linkedRefChain.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChain)
  EndIf
  If linkedRefChildren.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChildren)
  EndIf
  akTerminalRef.SetValue(NativeTerminalAlarm_AnyOn, (anyOn as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalAlarm_AnyEnabled, (anyEnabled as Int) as Float)
EndFunction

Function UpdateTerminalVariablesForArray(sq_alarmactivatorscript[] alarmArray)
  Int I = 0
  While I < alarmArray.Length
    sq_alarmactivatorscript theAlarm = alarmArray[I]
    If theAlarm.GetAlarmDisabled() == False
      anyEnabled = True
    EndIf
    If theAlarm.GetOpenState() >= 3
      anyOn = True
    EndIf
    I += 1
  EndWhile
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  sq_alarmactivatorscript[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalAlarm, 100) as sq_alarmactivatorscript[]
  sq_alarmactivatorscript[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalAlarm, None) as sq_alarmactivatorscript[]
  If linkedRefChain.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
  EndIf
  If linkedRefChildren.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
  EndIf
EndEvent

Function HandleMenuItem(Int auiMenuItemID, sq_alarmactivatorscript[] alarmArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_TurnOn
    Int I = 0
    While I < alarmArray.Length
      alarmArray[I].TurnOnAlarm(True)
      I += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  ElseIf auiMenuItemID == menuItemID_TurnOff
    Int i = 0
    While i < alarmArray.Length
      alarmArray[i].TurnOnAlarm(False)
      i += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  ElseIf auiMenuItemID == menuItemID_Disable
    Int i = 0
    While i < alarmArray.Length
      alarmArray[i].DisableAlarm(True)
      i += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  ElseIf auiMenuItemID == menuItemID_Enable
    Int i = 0
    While i < alarmArray.Length
      alarmArray[i].DisableAlarm(False)
      i += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  EndIf
EndFunction
