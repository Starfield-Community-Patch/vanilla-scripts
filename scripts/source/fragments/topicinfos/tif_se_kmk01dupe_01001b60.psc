ScriptName Fragments:TopicInfos:TIF_SE_KMK01dupe_01001B60 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property ShipRepairKit Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  sescript kmyQuest = Self.GetOwningQuest() as sescript
  kmyQuest.RemoveItemFromPlayerOrShip(ShipRepairKit as Form, 1, 10, True)
EndFunction
