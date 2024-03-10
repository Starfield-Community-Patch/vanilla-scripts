ScriptName Fragments:TopicInfos:TIF_DialogueCFTheKey_0017156D Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  dialoguecfthekeyquestscript kmyQuest = Self.GetOwningQuest() as dialoguecfthekeyquestscript
  kmyQuest.DialogueShipServices.RepairPlayerShip()
EndFunction
