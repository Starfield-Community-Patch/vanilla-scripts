ScriptName FAB_PlaySoundScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property SoundToPlay Auto Const
Bool Property bPlayOnEnd = True Auto Const

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If bPlayOnEnd == False
    SoundToPlay.Play(Game.GetPlayer() as ObjectReference, None, None)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If bPlayOnEnd == True
    SoundToPlay.Play(Game.GetPlayer() as ObjectReference, None, None)
  EndIf
EndEvent
