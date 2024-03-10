ScriptName MQ101PirateLandingShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101LandingEncounter01 Auto Const

;-- State -------------------------------------------
Auto State WaitingToTrigger

  Event OnShipLanding(Bool abComplete)
    If MQ101LandingEncounter01.IsRunning() == False
      Self.GotoState("hasbeentriggered")
      MQ101LandingEncounter01.Start()
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered
EndState
