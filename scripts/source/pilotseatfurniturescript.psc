ScriptName PilotSeatFurnitureScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool suppressDefaultActivationBlockedMessage

;-- Properties --------------------------------------
Message Property PilotSeatNotAuthorizedMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && Self.IsActivationBlocked() && !suppressDefaultActivationBlockedMessage
    PilotSeatNotAuthorizedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Function suppressDefaultActivationBlockedMessage(Bool shouldSuppress)
  suppressDefaultActivationBlockedMessage = shouldSuppress
EndFunction
