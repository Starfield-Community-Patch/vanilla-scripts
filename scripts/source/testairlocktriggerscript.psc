ScriptName TestAirlockTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property ArmorTypeHelmet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (Self.GetLinkedRef(None) as testairlockscript01).bPowerered == False
    
  ElseIf Self.GetLinkedRef(None).GetOpenState() == 3 && Self.GetLinkedRef(None).IsLocked() == False
    If (akActionRef as Actor).WornHasKeyword(ArmorTypeHelmet)
      Self.GetLinkedRef(None).Activate(akActionRef, True)
    EndIf
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If (Self.GetLinkedRef(None) as testairlockscript01).bPowerered == False
    
  Else
    While Self.GetLinkedRef(None).GetOpenState() == 2
      Utility.Wait(0.25)
    EndWhile
    If Self.GetLinkedRef(None).GetOpenState() == 1
      If Self.GetTriggerObjectCount() == 0
        Self.GetLinkedRef(None).Activate(akActionRef, True)
      EndIf
    EndIf
  EndIf
EndEvent
