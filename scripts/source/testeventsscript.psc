ScriptName TestEventsScript Extends ObjectReference
{ sends out traces for several events }

;-- Variables ---------------------------------------
Actor Player

;-- Functions ---------------------------------------

Event OnCellAttach()
  ; Empty function
EndEvent

Event OnCellDetach()
  ; Empty function
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  ; Empty function
EndEvent

Event OnUnLoad()
  ; Empty function
EndEvent

Event OnLoad()
  Player = Game.GetPlayer()
EndEvent
