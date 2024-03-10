ScriptName Fragments:TopicInfos:TIF_UC01_ShipSimQuest_0003D4C1 Extends TopicInfo Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  uc01_shipsimulationquestscript kmyQuest = Self.GetOwningQuest() as uc01_shipsimulationquestscript
  kmyQuest.ClearShipUpgrades()
EndFunction
