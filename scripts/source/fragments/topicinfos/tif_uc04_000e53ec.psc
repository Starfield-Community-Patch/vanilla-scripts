ScriptName Fragments:TopicInfos:TIF_UC04_000E53EC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property UC04_694_YumiTerrormorphScene_HellosStartup Auto Const mandatory
Scene Property UC04_695_Yumi_Post2ndMorphKilled Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !UC04_694_YumiTerrormorphScene_HellosStartup.IsPlaying() && !UC04_695_Yumi_Post2ndMorphKilled.IsPlaying()
    UC04_694_YumiTerrormorphScene_HellosStartup.Start()
  EndIf
EndFunction
