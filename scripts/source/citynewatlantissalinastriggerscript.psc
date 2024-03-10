ScriptName CityNewAtlantisSalinasTriggerScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC_NA_SalinasVendorActive Auto Const
GlobalVariable Property UC_NA_SalinasVendorTimer Auto Const
GlobalVariable Property GameDaysPassed Auto Const

;-- Functions ---------------------------------------

Event OnTriggerLeave(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    If UC_NA_SalinasVendorActive.GetValue() == 1.0
      UC_NA_SalinasVendorActive.SetValue(0.0)
      UC_NA_SalinasVendorTimer.SetValue(GameDaysPassed.GetValue() + 0.200000003)
    EndIf
  EndIf
EndEvent
