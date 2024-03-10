ScriptName LC102LifeSupportSwitchScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool lifeSupportMachineReset = False

;-- Properties --------------------------------------
GlobalVariable Property LC102LifeSupportResetCount Auto Const
wwiseevent Property WwiseEvent_QST_CF04_LifeSupport_Power_Off Auto Const
wwiseevent Property LifeSupportMachineOffEvent Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If lifeSupportMachineReset == False
    Self.BlockActivation(True, True)
    ObjectReference machineRunningSoundMarker = Self.GetLinkedRef(None)
    If machineRunningSoundMarker
      machineRunningSoundMarker.Disable(False)
    EndIf
    LifeSupportMachineOffEvent.Play(Self as ObjectReference, None, None)
    LC102LifeSupportResetCount.value = LC102LifeSupportResetCount.value + 1.0
    If LC102LifeSupportResetCount.value >= 3.0
      WwiseEvent_QST_CF04_LifeSupport_Power_Off.Play(Self as ObjectReference, None, None)
    EndIf
    lifeSupportMachineReset = True
  EndIf
EndEvent
