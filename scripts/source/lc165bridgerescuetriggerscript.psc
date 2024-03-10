ScriptName LC165BridgeRescueTriggerScript Extends ObjectReference
{ Script for the rescue trigger inside the bridge in LC165. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
lc165questscript Property MQ302B Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  MQ302B.StarbornBridgeForceRescueTeleport(akActionRef as Actor)
EndEvent
