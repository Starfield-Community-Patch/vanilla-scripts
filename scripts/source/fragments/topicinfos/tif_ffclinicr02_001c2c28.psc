ScriptName Fragments:TopicInfos:TIF_FFClinicR02_001C2C28 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFClinicR02BiosuppressantValue Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().AddItem(Credits as Form, FFClinicR02BiosuppressantValue.GetValueInt() * 3, False)
EndFunction
