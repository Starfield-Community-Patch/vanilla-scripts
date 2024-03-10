ScriptName Fragments:TopicInfos:TIF_CF05_0021617A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_CargoBaySecurityDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Alias_CF05_CargoBaySecurityDoor.GetRef().SetOpen(True)
EndFunction
