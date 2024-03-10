ScriptName EnableLinkedRefOnDestroyed Extends ObjectReference Const
{ Enables the Linked Ref when destroyed }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkEnable Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akDestroyer)
  Self.GetLinkedRef(LinkEnable).Enable(False)
EndEvent
