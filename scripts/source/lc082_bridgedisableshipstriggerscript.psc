ScriptName LC082_BridgeDisableShipsTriggerScript Extends ObjectReference
{ Script for the LC082 Bridge Trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  lc082_vigilancequestscript Property LC082 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  LC082.SetEscortShipsEnabled(False)
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  LC082.SetEscortShipsEnabled(True)
EndEvent
