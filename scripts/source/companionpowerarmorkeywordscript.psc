ScriptName CompanionPowerArmorKeywordScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property pAttachPassenger Auto Const
Keyword Property pAttachSlot2 Auto Const
Keyword Property isPowerArmorFrame Auto Const

;-- Functions ---------------------------------------

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  If akBaseObject.HasKeyword(isPowerArmorFrame) == True
    Self.RemoveKeyword(pAttachPassenger)
    Self.AddKeyword(pAttachSlot2)
  EndIf
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
  If akBaseObject.HasKeyword(isPowerArmorFrame) == True
    Self.RemoveKeyword(pAttachSlot2)
    Self.AddKeyword(pAttachPassenger)
  EndIf
EndEvent
