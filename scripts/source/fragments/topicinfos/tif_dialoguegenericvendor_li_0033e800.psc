ScriptName Fragments:TopicInfos:TIF_DialogueGenericVendor_LI_0033E800 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript
  kmyQuest.RepairPlayerShip()
EndFunction
