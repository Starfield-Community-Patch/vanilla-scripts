ScriptName NativeTerminal:ContainerScript Extends TerminalMenu
{ handles containers via native terminal }

;-- Variables ---------------------------------------
Bool anyLocked = False
Bool anySafe = False
Int containerCount = 0

;-- Properties --------------------------------------
Group autofillProperties
  ActorValue Property NativeTerminalContainer_AnyLocked Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalContainer_Count Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalContainer_AnySafe Auto Const mandatory
  { autofill }
  Keyword Property LootSafeKeyword Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalContainer Auto Const mandatory
Int Property menuItemID_Unlock01 = 1 Auto Const
Int Property menuItemID_Unlock02 = 2 Auto Const
Int Property menuItemID_Unlock03 = 3 Auto Const
Int Property menuItemID_Unlock04 = 4 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef)
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalContainer, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalContainer, None)
  anyLocked = False
  anySafe = False
  containerCount = 0
  If linkedRefChain.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChain)
  EndIf
  If linkedRefChildren.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChildren)
  EndIf
  akTerminalRef.SetValue(NativeTerminalContainer_AnyLocked, (anyLocked as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalContainer_AnySafe, (anySafe as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalContainer_Count, containerCount as Float)
EndFunction

Function UpdateTerminalVariablesForArray(ObjectReference[] ContainerArray)
  Int I = 0
  While I < ContainerArray.Length
    ObjectReference theContainer = ContainerArray[I]
    If theContainer.IsLocked()
      anyLocked = True
    EndIf
    If theContainer.HasKeyword(LootSafeKeyword)
      anySafe = True
    EndIf
    containerCount += 1
    I += 1
  EndWhile
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalContainer, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalContainer, None)
  If linkedRefChain.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
  EndIf
  If linkedRefChildren.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
  EndIf
EndEvent

Function HandleMenuItem(Int auiMenuItemID, ObjectReference[] refArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02 || auiMenuItemID == menuItemID_Unlock03 || auiMenuItemID == menuItemID_Unlock04
    Int I = 0
    While I < refArray.Length
      refArray[I].Unlock(False)
      I += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  EndIf
EndFunction
