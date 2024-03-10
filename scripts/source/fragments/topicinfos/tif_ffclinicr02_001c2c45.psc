ScriptName Fragments:TopicInfos:TIF_FFClinicR02_001C2C45 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFClinicR02AntimicrobialValue Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().AddItem(Credits as Form, FFClinicR02AntimicrobialValue.GetValueInt() * 7, False)
EndFunction
