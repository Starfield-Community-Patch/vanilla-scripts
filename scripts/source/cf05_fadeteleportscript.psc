ScriptName CF05_FadeTeleportScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PlayerTeleportGuard Auto Const mandatory
Float Property SecondsBeforeFade = 0.0 Auto Const
Float Property FadeDuration = 0.5 Auto Const
Float Property WaitTime = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Game.FadeOutGame(True, True, SecondsBeforeFade, FadeDuration, True)
  inputenablelayer myLayer = inputenablelayer.Create()
  myLayer.DisablePlayerControls(True, False, False, False, False, False, False, False, False, False, False)
  Utility.Wait(WaitTime)
  Game.GetPlayer().MoveTo(Alias_PlayerTeleportGuard.GetRef(), 0.0, 0.0, 0.0, True, False)
  Utility.Wait(WaitTime)
  myLayer.Delete()
  Game.FadeOutGame(False, True, SecondsBeforeFade, FadeDuration, False)
EndEvent
