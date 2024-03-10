ScriptName LC043_IDCardReader Extends IDCardReader
{ Variant ID Card Reader for LC043, with support for variations needed by the quest. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group LC043IDCardReaderProperties
  Bool Property ShouldAlwaysDeny = False Auto Const
  { If True, this ID Card Reader will always display IDCardReaderFailMissingPrereqMessage, and will never open its door. }
  Bool Property ShouldOnlyOpen = False Auto Const
  { If True, this ID Card Reader will only open its door, not close it. }
  Bool Property ShouldForceOpenDockingPortDoor = False Auto Const
  { If True, if our door is a Docking Port door, open it. }
EndGroup


;-- Functions ---------------------------------------

Function IDReaderOpenDoor(Bool shouldBeOpen)
  If ShouldAlwaysDeny
    IDCardReaderFailMissingPrereqMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  ElseIf ShouldOnlyOpen
    If shouldBeOpen
      ObjectReference doorLink = Self.GetLinkedRef(LinkIDReader)
      Int openState = doorLink.GetOpenState()
      If openState == 3 || openState == 4
        doorLink.SetOpen(True)
      EndIf
    EndIf
  ElseIf ShouldForceOpenDockingPortDoor
    defaultmultistateactivator doorlink = Self.GetLinkedRef(LinkIDReader) as defaultmultistateactivator
    If doorlink != None
      doorlink.SetOpen(True)
      doorlink.SetAnimationState("Green", False)
    EndIf
  Else
    Parent.IDReaderOpenDoor(shouldBeOpen)
  EndIf
EndFunction
