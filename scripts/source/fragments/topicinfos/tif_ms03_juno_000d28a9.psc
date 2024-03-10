ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D28A9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SoundMarkerDisabler Auto Const
wwiseevent Property JunoShutdownEvent Auto Const
ObjectReference Property JunoEventMarker Auto Const
ObjectReference Property JunoPromptTrigger Auto Const
ObjectReference Property Juno00 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  JunoShutdownEvent.Play(JunoEventMarker, None, None)
  Utility.Wait(2.0)
  SoundMarkerDisabler.Disable(False)
  Juno00.PlayAnimation("Play02")
  JunoPromptTrigger.BlockActivation(True, True)
EndFunction
