ScriptName Fragments:TopicInfos:TIF_DialogueShipServices_0014A832_1 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript
  kmyQuest.RepairPlayerShip()
EndFunction
