ScriptName Scene Extends Form Native hidden

;-- Functions ---------------------------------------

Function ForceStart() Native

Quest Function GetOwningQuest() Native

Bool Function IsActionComplete(Int aiActionID) Native

Bool Function IsPlaying() Native

Event OnAction(Int auiActionID, ReferenceAlias akAlias)
  ; Empty function
EndEvent

Event OnBegin()
  ; Empty function
EndEvent

Event OnEnd()
  ; Empty function
EndEvent

Event OnPhaseBegin(Int auiPhaseIndex)
  ; Empty function
EndEvent

Event OnPhaseEnd(Int auiPhaseIndex)
  ; Empty function
EndEvent

Function Pause(Bool abPause) Native

Function Start() Native

Function Stop() Native
