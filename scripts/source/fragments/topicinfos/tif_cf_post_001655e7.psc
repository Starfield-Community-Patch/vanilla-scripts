ScriptName Fragments:TopicInfos:TIF_CF_Post_001655E7 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  cf_postquestscript kmyQuest = Self.GetOwningQuest() as cf_postquestscript
  kmyQuest.DialogueShipServices.RepairPlayerShip()
EndFunction
