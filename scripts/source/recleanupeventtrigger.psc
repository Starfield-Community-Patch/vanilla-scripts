ScriptName RECleanupEventTrigger Extends ObjectReference
{ used for testing - simply sends cleanup event }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
reparentscript Property REParent Auto
{ BASEOBJECT property - REParent quest, used to send cleanup custom event }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  REParent.SendCleanupEvent()
EndEvent
