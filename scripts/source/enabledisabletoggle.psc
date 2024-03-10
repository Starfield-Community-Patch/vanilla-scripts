ScriptName EnableDisableToggle Extends ObjectReference conditional
{ Toggles between enabling and disabling linkedref }

;-- Variables ---------------------------------------
Bool isEnabled = True
ObjectReference linkedref

;-- Functions ---------------------------------------

Event OnLoad()
  linkedref = Self.GetLinkedRef(None)
EndEvent

Event onActivate(ObjectReference triggerRef)
  If isEnabled
    isEnabled = False
    linkedref.disable(False)
  Else
    isEnabled = True
    linkedref.enable(False)
  EndIf
EndEvent
