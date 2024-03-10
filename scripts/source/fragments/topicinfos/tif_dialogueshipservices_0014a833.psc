ScriptName Fragments:TopicInfos:TIF_DialogueShipServices_0014A833 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const
MiscObject Property Credits Auto Const mandatory
ActorValue Property Health Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  dialogueshipservicesscript kmyQuest = Self.GetOwningQuest() as dialogueshipservicesscript
  kmyQuest.RepairPlayerShip()
EndFunction
