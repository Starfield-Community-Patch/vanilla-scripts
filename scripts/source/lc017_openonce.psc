ScriptName LC017_OpenOnce Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkToPowerSource Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If Self.GetLinkedRef(LinkToPowerSource).IsPowered()
    Self.GetLinkedRef(None).SetOpen(True)
  EndIf
EndEvent
