ScriptName UC05_PlaySoundonActivate Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property SuccessSound Auto Const mandatory
wwiseevent Property FailureSound Auto Const mandatory
Quest Property myQuest Auto Const mandatory
Int Property HasKey Auto Const mandatory
Int Property AccessGranted Auto Const mandatory
Keyword Property BlockPlayerActivation Auto Const mandatory

;-- State -------------------------------------------
State busy
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.goToState("busy")
    If (akActionRef == Game.GetPlayer() as ObjectReference) && myQuest.GetStageDone(HasKey) && !myQuest.GetStageDone(AccessGranted)
      SuccessSound.PlayAndWait(Self as ObjectReference, None, None)
      Self.AddKeyword(BlockPlayerActivation)
    EndIf
    Self.goToState("waiting")
  EndEvent
EndState
