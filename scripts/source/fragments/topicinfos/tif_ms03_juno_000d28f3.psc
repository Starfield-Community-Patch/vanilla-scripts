ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D28F3 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property JunoShutdownEvent Auto Const
ObjectReference Property SoundMarkerDisabler Auto Const
ObjectReference Property JunoEventMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  JunoShutdownEvent.Play(JunoEventMarker, None, None)
  Utility.Wait(2.0)
  SoundMarkerDisabler.Disable(False)
EndFunction
