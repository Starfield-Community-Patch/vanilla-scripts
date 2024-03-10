ScriptName Fragments:TopicInfos:TIF_DialogueUCNewAtlantis_0023FA1C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01_Tuala_Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !UC01_Tuala_Misc.GetStageDone(100)
    UC01_Tuala_Misc.SetStage(100)
  EndIf
EndFunction
