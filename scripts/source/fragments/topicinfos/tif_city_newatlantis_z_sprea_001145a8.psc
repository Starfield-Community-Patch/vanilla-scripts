ScriptName Fragments:TopicInfos:TIF_City_NewAtlantis_Z_Sprea_001145A8 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property pCity_NA_Z_SpreadTheNewsDataSlate Auto Const mandatory
ReferenceAlias Property George Auto Const
ReferenceAlias Property NewsSlate Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
EndFunction
