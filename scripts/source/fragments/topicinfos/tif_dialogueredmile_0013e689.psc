ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_0013E689 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueShipServices Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  (DialogueShipServices as dialogueshipservicesscript).RepairPlayerShip()
EndFunction
