ScriptName Fragments:TopicInfos:TIF_DialogueGagarin_UC_GG_0015D023 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC_GG_Connect_Misc Auto Const mandatory
Quest Property City_GG_Connections Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  If !UC_GG_Connect_Misc.GetStageDone(100) && !City_GG_Connections.GetStageDone(100)
    UC_GG_Connect_Misc.Start()
  EndIf
EndFunction
