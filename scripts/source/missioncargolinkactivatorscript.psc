ScriptName MissionCargoLinkActivatorScript Extends ObjectReference
{ blocks activation unless allowed by quest }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MissionCargoLinkActivatorBlockedMessage Auto Const
{ message to show if activated when inactive }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.BlockActivation(True, False)
EndEvent

Function AllowActivation(Bool bActivationAllowed)
  If bActivationAllowed
    Self.gotoState("active")
  Else
    Self.gotoState("inactive")
  EndIf
EndFunction

;-- State -------------------------------------------
State active

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State inactive

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      MissionCargoLinkActivatorBlockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  EndEvent
EndState
