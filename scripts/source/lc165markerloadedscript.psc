ScriptName LC165MarkerLoadedScript Extends ObjectReference
{ Script for a marker. On load, sets LC165MarkerLoadedValue to 1, to flag that the marker has been loaded at least once before. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property LC165MarkerLoadedValue Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnLoad()
    Self.GoToState("Done")
    Self.SetValue(LC165MarkerLoadedValue, 1.0)
  EndEvent
EndState
