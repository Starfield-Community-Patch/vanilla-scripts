ScriptName FAB_InfoFadeScript Extends TopicInfo
{ This allows fading out/in when an info begins/ends }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property OnBegin = True Auto Const
{ If True (default), stop camera when the Info begins. If False then stop camera when the info ends. }
Bool Property FadeOut = True Auto Const
{ If True (default), fade out the camera - if False then fade back in }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If OnBegin == True
    Self.FadeOutNow()
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If OnBegin == False
    Self.FadeOutNow()
  EndIf
EndEvent

Function FadeOutNow()
  If FadeOut == True
    Game.FadeOutGame(True, True, 0.0, 1.0, True)
  Else
    Game.FadeOutGame(False, True, 0.0, 1.0, False)
  EndIf
EndFunction
