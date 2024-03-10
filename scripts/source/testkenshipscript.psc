ScriptName TestKenShipScript Extends SpaceshipReference Const

;-- Functions ---------------------------------------

Event OnShipRampDown()
  ; Empty function
EndEvent

Event OnShipLanding(Bool abComplete)
  If abComplete
    
  EndIf
EndEvent

Function TestDisableWithTakeOff()
  Self.DisableWithTakeOffOrLanding()
EndFunction

Function TestDisableTakeOffNoWait()
  Self.DisableWithTakeOffOrLandingNoWait()
EndFunction

Function TestDisableWithGrav()
  Self.DisableWithGravJump()
EndFunction

Function TestDisableGravJumpNoWait()
  Self.DisableWithGravJumpNoWait()
EndFunction

Function TestEnableWithLanding()
  Self.EnableWithLanding()
EndFunction

Function TestEnableWithLandingNoWait()
  Self.EnableWithLandingNoWait()
EndFunction

Function TestEnable()
  Self.Enable(True)
EndFunction

Function TestEnableNoWait()
  Self.EnableNoWait(False)
EndFunction

Function TestDisable()
  Self.Disable(True)
EndFunction

Function TestDisableNoWait()
  Self.DisableNoWait(False)
EndFunction

Function TestGetPlanet()
  planet planetAt = Self.GetCurrentPlanet()
EndFunction
