ScriptName TestSyncScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference theThing = Self as ObjectReference
  theThing = Self.GetLinkedRef(LinkCustom01)
  theThing.SetOpen(False)
EndEvent
