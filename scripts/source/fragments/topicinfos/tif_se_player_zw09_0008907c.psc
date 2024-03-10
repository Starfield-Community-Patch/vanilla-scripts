ScriptName Fragments:TopicInfos:TIF_SE_Player_ZW09_0008907C Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property PSE_Player_ZW09 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  PSE_Player_ZW09.setstage(250)
EndFunction
