ScriptName SignalSender_OnActivate Extends SignalSenderScript
{ Sends a Signal to SignalReceiverScripts.

SignalParameters.Ref1 = akActionRef  (from OnActivate event)

ConditionReferences.Subject = self
ConditionReferences.Target = akActionRef  (from OnActivate event) }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  signalsenderscript:signalparameters signalParameters = new signalsenderscript:signalparameters
  signalParameters.Ref1 = akActionRef
  signalsenderscript:conditionreferences conditionReferences = new signalsenderscript:conditionreferences
  conditionReferences.Subject = Self as ObjectReference
  conditionReferences.Target = akActionRef
  Self.SendSignal(signalParameters, conditionReferences)
EndEvent
