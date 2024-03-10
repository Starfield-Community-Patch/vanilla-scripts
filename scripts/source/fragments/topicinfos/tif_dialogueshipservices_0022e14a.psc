ScriptName Fragments:TopicInfos:TIF_DialogueShipServices_0022E14A Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript
  kmyQuest.RepairPlayerShip()
EndFunction
