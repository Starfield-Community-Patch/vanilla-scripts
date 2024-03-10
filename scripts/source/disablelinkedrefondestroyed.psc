ScriptName DisableLinkedRefOnDestroyed Extends ObjectReference Const
{ Disables the Linked Ref when destroyed }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkEnable Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akDestroyer)
  Self.GetLinkedRef(LinkEnable).Disable(False)
EndEvent
