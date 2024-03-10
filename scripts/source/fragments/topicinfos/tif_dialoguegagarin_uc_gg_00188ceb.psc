ScriptName Fragments:TopicInfos:TIF_DialogueGagarin_UC_GG_00188CEB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_GG_Marines Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  City_GG_Marines.Start()
EndFunction
