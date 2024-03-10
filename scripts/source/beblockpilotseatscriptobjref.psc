ScriptName BEBlockPilotSeatScriptObjRef Extends ObjectReference
{ Script placed on a ship's pilot seat. Blocks players from sitting in the seat and taking over the ship. ObjectReference Variant }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property PilotSeatNotAuthorizedMessage Auto Const mandatory
{ Message to display when the player tries to sit in the ship's pilot seat while the block is in place. }

;-- Functions ---------------------------------------

Event OnInit()
  Self.BlockActivation(True, False)
EndEvent

Event OnActivate(ObjectReference akActivator)
  PilotSeatNotAuthorizedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndEvent
