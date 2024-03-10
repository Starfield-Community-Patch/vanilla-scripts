ScriptName MQ305GhostScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property AbStarbornTeleport Auto Const mandatory
VisualEffect Property UnityActorEffect Auto Const mandatory

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
    UnityActorEffect.Play(Self as ObjectReference, -1.0, None)
    Self.AddSpell(AbStarbornTeleport, True)
  EndEvent
EndState
