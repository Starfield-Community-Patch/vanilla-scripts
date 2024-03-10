ScriptName AudioContainerNoAnimScript Extends ObjectReference conditional
{ plays a sound on menu open/close }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property OpenSound Auto Const
wwiseevent Property CloseSound Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForMenuOpenCloseEvent("ContainerMenu")
EndEvent

Event OnUnload()
  Self.UnregisterForMenuOpenCloseEvent("ContainerMenu")
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ContainerMenu"
    If abOpening == False
      CloseSound.PlayAndWait(Self as ObjectReference, None, None)
    Else
      OpenSound.PlayAndWait(Self as ObjectReference, None, None)
    EndIf
  EndIf
EndEvent
