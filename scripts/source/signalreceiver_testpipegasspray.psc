ScriptName SignalReceiver_TestPipeGasSpray Extends SignalReceiverScript

;-- Variables ---------------------------------------
Bool Damaged
Bool IsSpraying
Bool SwitchOn

;-- Properties --------------------------------------
Group CustomReceiveSignal_Properties
  Keyword Property Signal_SwitchOn Auto Const mandatory
  Keyword Property Signal_SwitchOff Auto Const mandatory
  Keyword Property Signal_ObjectDamaged Auto Const mandatory
  Message Property TestSprayMessage Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ReceiveSignalCustom(signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  IsSpraying = False
  If SignalSignature.Signal == Signal_SwitchOn
    SwitchOn = True
    Self.SprayIfAppropriate()
  ElseIf SignalSignature.Signal == Signal_SwitchOff
    SwitchOn = False
    Self.SprayIfAppropriate()
  ElseIf SignalSignature.Signal == Signal_ObjectDamaged
    Damaged = True
    Self.SprayIfAppropriate()
  EndIf
EndFunction

Function SprayIfAppropriate()
  If SwitchOn && Damaged
    IsSpraying = True
    TestSprayMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    IsSpraying = False
  EndIf
EndFunction

Function HandleCustomResult(signalreceiverscript:result Result, ObjectReference[] ValidTargetRefs, signalsenderscript:signalsignature SignalSignature, signalsenderscript:signalparameters SignalParameters)
  If IsSpraying && SignalSignature.Signal == Signal_SwitchOff
    (Result.FormParam1 as Message).Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndFunction
