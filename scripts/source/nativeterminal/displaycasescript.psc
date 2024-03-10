ScriptName NativeTerminal:DisplayCaseScript Extends TerminalMenu
{ handles display cases via native terminal }

;-- Variables ---------------------------------------
Bool anyLocked = False
Bool anyWeaponCase = False
Bool anyWeaponRack = False
Int caseCount = 0

;-- Properties --------------------------------------
Group autofillProperties
  Keyword Property DisplayCaseTypeWeaponCase Auto Const mandatory
  { autofill }
  Keyword Property DisplayCaseTypeWeaponRack Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_AnyLocked Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_AnyWeaponCase Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_AnyWeaponRack Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_Count Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalDisplayCase Auto Const mandatory
Int Property menuItemID_Unlock01 = 1 Auto Const
Int Property menuItemID_Unlock02 = 2 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef)
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDisplayCase, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDisplayCase, None)
  anyLocked = False
  anyWeaponCase = False
  anyWeaponRack = False
  caseCount = 0
  If linkedRefChain.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChain)
  EndIf
  If linkedRefChildren.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChildren)
  EndIf
  akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyLocked, (anyLocked as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyWeaponCase, (anyWeaponCase as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyWeaponRack, (anyWeaponRack as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalDisplayCase_Count, caseCount as Float)
EndFunction

Function UpdateTerminalVariablesForArray(ObjectReference[] displayCaseArray)
  Int I = 0
  While I < displayCaseArray.Length
    ObjectReference theCase = displayCaseArray[I]
    If theCase.IsLocked()
      anyLocked = True
    EndIf
    If theCase.HasKeyword(DisplayCaseTypeWeaponCase)
      anyWeaponCase = True
    ElseIf theCase.HasKeyword(DisplayCaseTypeWeaponRack)
      anyWeaponRack = True
    EndIf
    caseCount += 1
    I += 1
  EndWhile
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDisplayCase, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDisplayCase, None)
  If linkedRefChain.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
  EndIf
  If linkedRefChildren.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
  EndIf
EndEvent

Function HandleMenuItem(Int auiMenuItemID, ObjectReference[] refArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02
    Int I = 0
    While I < refArray.Length
      refArray[I].Unlock(False)
      refArray[I].SetOpen(True)
      I += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  EndIf
EndFunction
