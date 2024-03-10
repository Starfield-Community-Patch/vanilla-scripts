ScriptName SignalSender_OnActorValue Extends SignalSenderScript
{ Sends a Signal to SignalReceiverScripts

SignalParameters.Ref1 = self
SignalParameters.AV1 = TargetAV

ConditionReferences.Subject = self
ConditionReferences.Target = self }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AdditionalData
  Bool Property DoOnce = True Auto Const
  { Default: true; If false will re-up the registration for the actorvalue event }
  Int Property ChangeTypeEnum = 1 Auto Const
  { The type of actorvalue 
0 = OnActorValueLessThan				= 0 const 
1 = OnActorValueLessThanOrEqualTo		= 1 const ;default
2 = OnActorValueChange					= 2 const 
3 = OnActorValueGreaterThanOrEqualTo	= 3 const 
4 = OnActorValueGreaterThan				= 4 const 

* NOTE: the OrEqualTo events are being faked right now by adding/subtracting .001 to the requested value until we have those events proper
GEN-296056 Papyrus: Actor value greater/less than events should have a "equals" option }
  ActorValue Property TargetAV Auto Const mandatory
  { the ActorValue to watch }
  Float Property TargetValue Auto Const mandatory
  { Value needed to send Signal }
EndGroup

Int Property iChangeType_OnActorValueLessThan = 0 AutoReadOnly
Int Property iChangeType_OnActorValueLessThanOrEqualTo = 1 AutoReadOnly
Int Property iChangeType_OnActorValueChange = 2 AutoReadOnly
Int Property iChangeType_OnActorValueGreaterThanOrEqualTo = 3 AutoReadOnly
Int Property iChangeType_OnActorValueGreaterThan = 4 AutoReadOnly

;-- Functions ---------------------------------------

Function RegisterForOnAVEvent()
  Float value = TargetValue
  If ChangeTypeEnum == Self.iChangeType_OnActorValueLessThan
    Self.RegisterForActorValueLessThanEvent(Self as ObjectReference, TargetAV, value)
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueLessThanOrEqualTo
    value += 0.001
    Self.RegisterForActorValueLessThanEvent(Self as ObjectReference, TargetAV, value)
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueChange
    Self.RegisterForActorValueChangedEvent(Self as ObjectReference, TargetAV)
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueGreaterThanOrEqualTo
    value -= 0.001
    Self.RegisterForActorValueGreaterThanEvent(Self as ObjectReference, TargetAV, value)
  ElseIf ChangeTypeEnum == Self.iChangeType_OnActorValueGreaterThan
    Self.RegisterForActorValueGreaterThanEvent(Self as ObjectReference, TargetAV, value)
  EndIf
EndFunction

Event OnLoad()
  Self.RegisterForOnAVEvent()
EndEvent

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  Self.CreateParmsAndSendSignalAndRegisterForEvent()
EndEvent

Event OnActorValueGreaterThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.CreateParmsAndSendSignalAndRegisterForEvent()
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Self.CreateParmsAndSendSignalAndRegisterForEvent()
EndEvent

Function CreateParmsAndSendSignalAndRegisterForEvent()
  signalsenderscript:signalparameters signalParameters = new signalsenderscript:signalparameters
  signalParameters.Ref1 = Self as ObjectReference
  signalParameters.AV1 = TargetAV
  signalsenderscript:conditionreferences conditionReferences = new signalsenderscript:conditionreferences
  conditionReferences.Subject = Self as ObjectReference
  conditionReferences.Target = Self as ObjectReference
  Self.SendSignal(signalParameters, conditionReferences)
  If DoOnce
    Self.GotoState("Done")
  EndIf
  Self.RegisterForOnAVEvent()
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function
  EndEvent

  Function RegisterForOnAVEvent()
    ; Empty function
  EndFunction
EndState
