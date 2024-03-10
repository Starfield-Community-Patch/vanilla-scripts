ScriptName DR011TriggerScript Extends ObjectReference
{ Script for a trigger that causes a ship to land in DR011's Shuttle Bay. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference akActionRef)
    Self.GoToState("Done")
    (Self.GetLinkedRef(LinkCustom01) as shuttlebaydoormanagerscript).OpenShuttleBayDoors()
    Self.GetLinkedRef(LinkCustom02).Enable(False)
  EndEvent
EndState
