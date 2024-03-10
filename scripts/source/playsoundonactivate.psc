ScriptName PlaySoundOnActivate Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property ActivateSound Auto Const
Bool Property bCanPlayAgain = True Auto conditional

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If bCanPlayAgain == True
    bCanPlayAgain = False
    If ActivateSound.PlayAndWait(Self as ObjectReference, None, None)
      bCanPlayAgain = True
    Else
      bCanPlayAgain = True
    EndIf
  EndIf
EndEvent
