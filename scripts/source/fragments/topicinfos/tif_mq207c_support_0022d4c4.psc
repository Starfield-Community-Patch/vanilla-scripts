ScriptName Fragments:TopicInfos:TIF_MQ207C_Support_0022D4C4 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Nishina01_I_SecurityOfficeTerminal Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Alias_Nishina01_I_SecurityOfficeTerminal.GetRef().Unlock(False)
EndFunction
