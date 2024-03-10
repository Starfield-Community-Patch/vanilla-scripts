ScriptName NativeTerminal:TrapScript Extends TerminalMenu
{ handles traps via native terminal }

;-- Variables ---------------------------------------
Bool anyActive = False

;-- Properties --------------------------------------
Group autofillProperties
  ActorValue Property NativeTerminalTrap_AnyActive Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalTrap Auto Const mandatory
Int Property menuItemID_TurnOn = 1 Auto Const
Int Property menuItemID_TurnOff = 2 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef)
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  trapbase[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalTrap, 100) as trapbase[]
  trapbase[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalTrap, None) as trapbase[]
  anyActive = False
  If linkedRefChain.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChain)
  EndIf
  If linkedRefChildren.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChildren)
  EndIf
  akTerminalRef.SetValue(NativeTerminalTrap_AnyActive, (anyActive as Int) as Float)
EndFunction

Function UpdateTerminalVariablesForArray(trapbase[] trapArray)
  Int I = 0
  While I < trapArray.Length
    trapbase theTrap = trapArray[I]
    If theTrap.bActive
      anyActive = True
    EndIf
    I += 1
  EndWhile
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  trapbase[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalTrap, 100) as trapbase[]
  trapbase[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalTrap, None) as trapbase[]
  If linkedRefChain.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
  EndIf
  If linkedRefChildren.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
  EndIf
EndEvent

Function HandleMenuItem(Int auiMenuItemID, trapbase[] trapArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_TurnOn
    Int I = 0
    While I < trapArray.Length
      trapArray[I].SetActive(True)
      I += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  ElseIf auiMenuItemID == menuItemID_TurnOff
    Int i = 0
    While i < trapArray.Length
      trapArray[i].SetActive(False)
      i += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  EndIf
EndFunction
