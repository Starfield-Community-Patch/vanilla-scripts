ScriptName MQ305EyesClosedScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property AnimFaceArchetypeEyesClosed Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function
EndEvent

;-- State -------------------------------------------
State HasLoaded

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForLoad

  Event OnLoad()
    Self.GotoState("HasLoaded")
    Self.ChangeAnimFaceArchetype(AnimFaceArchetypeEyesClosed)
  EndEvent
EndState
