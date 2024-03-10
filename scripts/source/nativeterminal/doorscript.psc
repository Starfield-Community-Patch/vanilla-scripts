ScriptName NativeTerminal:DoorScript Extends TerminalMenu
{ handles doors via native terminal }

;-- Variables ---------------------------------------
Bool anyClosed = False
Bool anyLocked = False
Int doorCount = 0
Bool hasDoors = False
Bool hasLoadDoors = False

;-- Properties --------------------------------------
Group autofillProperties
  Keyword Property IsLoadDoor Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_HasDoors Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_HasLoadDoors Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_AnyClosed Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_AnyLocked Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_Count Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalDoor Auto Const mandatory
Int Property menuItemID_Open01 = 1 Auto Const
Int Property menuItemID_Open02 = 2 Auto Const
Int Property menuItemID_Unlock01 = 3 Auto Const
Int Property menuItemID_Unlock02 = 4 Auto Const
Int Property menuItemID_Close01 = 5 Auto Const
Int Property menuItemID_Close02 = 6 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef)
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDoor, None)
  hasDoors = False
  hasLoadDoors = False
  anyClosed = False
  anyLocked = False
  doorCount = 0
  If linkedRefChain.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChain)
  EndIf
  If linkedRefChildren.Length > 0
    Self.UpdateTerminalVariablesForArray(linkedRefChildren)
  EndIf
  akTerminalRef.SetValue(NativeTerminalDoor_HasDoors, (hasDoors as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalDoor_HasLoadDoors, (hasLoadDoors as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalDoor_AnyClosed, (anyClosed as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalDoor_AnyLocked, (anyLocked as Int) as Float)
  akTerminalRef.SetValue(NativeTerminalDoor_Count, doorCount as Float)
EndFunction

Function UpdateTerminalVariablesForArray(ObjectReference[] doorArray)
  Int I = 0
  While I < doorArray.Length
    ObjectReference theDoor = doorArray[I]
    doorCount += 1
    If theDoor.HasKeyword(IsLoadDoor)
      hasLoadDoors = True
    Else
      hasDoors = True
    EndIf
    If theDoor.GetOpenState() >= 3
      anyClosed = True
    EndIf
    If theDoor.IsLocked()
      anyLocked = True
    EndIf
    I += 1
  EndWhile
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor, 100)
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDoor, None)
  If linkedRefChain.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef)
  EndIf
  If linkedRefChildren.Length > 0
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef)
  EndIf
EndEvent

Function HandleMenuItem(Int auiMenuItemID, ObjectReference[] doorArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_Open01 || auiMenuItemID == menuItemID_Open02
    Int I = 0
    While I < doorArray.Length
      doorArray[I].SetOpen(True)
      doorArray[I].Unlock(False)
      I += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  ElseIf auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02
    Int i = 0
    While i < doorArray.Length
      doorArray[i].Unlock(False)
      i += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  ElseIf auiMenuItemID == menuItemID_Close01 || auiMenuItemID == menuItemID_Close02
    Int i = 0
    While i < doorArray.Length
      doorArray[i].SetOpen(False)
      i += 1
    EndWhile
    Self.UpdateAllTerminalVariables(akTerminalRef)
  EndIf
EndFunction
