ScriptName MQ101ShipRepairScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnEffectStart(ObjectReference akShipTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
    If MQ101.GetStageDone(525)
      Self.gotoState("hasbeentriggered")
      MQ101.SetStage(530)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered
EndState
