ScriptName MQ102MoaraPilotSeatScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnLoad()
  Self.GetRef().BlockActivation(True, True)
EndEvent
