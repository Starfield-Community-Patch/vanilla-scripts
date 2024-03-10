ScriptName Fragments:TopicInfos:TIF_CF05_000BC73B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property LC043_GuardPackageControlValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Utility.Wait(5.0)
  akSpeaker.SetValue(LC043_GuardPackageControlValue, 1.0)
EndFunction
