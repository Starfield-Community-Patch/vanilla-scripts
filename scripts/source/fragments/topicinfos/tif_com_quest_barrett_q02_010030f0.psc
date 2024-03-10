ScriptName Fragments:TopicInfos:TIF_COM_Quest_Barrett_Q02_010030F0 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BQ01_Scene_BARK_8830_Barrett_CantHoldOn Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  BQ01_Scene_BARK_8830_Barrett_CantHoldOn.Start()
EndFunction
