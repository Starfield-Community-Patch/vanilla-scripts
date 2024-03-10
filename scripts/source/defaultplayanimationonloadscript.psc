ScriptName DefaultPlayAnimationOnLoadScript Extends ObjectReference default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String Property AnimationToPlay Auto Const mandatory
Bool Property PlayAnimationOnlyOnce = False Auto Const

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State PlayAnim

  Event OnLoad()
    If PlayAnimationOnlyOnce
      Self.GotoState("Done")
    EndIf
    Self.PlayAnimation(AnimationToPlay)
  EndEvent
EndState
