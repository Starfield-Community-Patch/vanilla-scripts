ScriptName Fragments:TopicInfos:TIF_DialogueShipServices_0014A852 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript
  kmyQuest.RefuelPlayerShip()
EndFunction
