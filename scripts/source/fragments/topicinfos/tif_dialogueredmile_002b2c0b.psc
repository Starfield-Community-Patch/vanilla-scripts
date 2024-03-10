ScriptName Fragments:TopicInfos:TIF_DialogueRedMile_002B2C0B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueShipServices Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  (DialogueShipServices as dialogueshipservicesscript).RefuelPlayerShip()
EndFunction
