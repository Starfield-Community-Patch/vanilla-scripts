ScriptName Fragments:TopicInfos:TIF_UC01_ShipSimQuest_002BA613 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  uc01_shipsimulationquestscript kmyQuest = Self.GetOwningQuest() as uc01_shipsimulationquestscript
  Self.GetOwningQuest().SetStage(650)
  kmyQuest.DirectPlayerToReset()
EndFunction
