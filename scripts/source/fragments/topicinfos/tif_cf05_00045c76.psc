ScriptName Fragments:TopicInfos:TIF_CF05_00045C76 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CF05_CommandBayGuardAccess Auto Const mandatory
Scene Property CF05_1600_EnsignAccessScene Auto Const mandatory
Quest Property CF05_Guard_SpeechChallenge01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  CF05_CommandBayGuardAccess.ForceRefTo(akSpeaker as ObjectReference)
  CF05_Guard_SpeechChallenge01.Start()
  CF05_1600_EnsignAccessScene.Start()
EndFunction
