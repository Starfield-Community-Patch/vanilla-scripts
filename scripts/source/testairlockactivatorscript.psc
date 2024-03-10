ScriptName TestAirlockActivatorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  testairlockscript01 LinkedScript = Self.GetLinkedRef(None) as testairlockscript01
  If LinkedScript.bPowerered == True
    LinkedScript.PowerOff()
  Else
    LinkedScript.PowerOn()
  EndIf
EndEvent
