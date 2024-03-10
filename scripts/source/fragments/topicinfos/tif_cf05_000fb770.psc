ScriptName Fragments:TopicInfos:TIF_CF05_000FB770 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF05_AlertedGuard_ForceGreeter03 Auto Const mandatory
Scene Property CF05_SuspiciousMarineAttackScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Alias_CF05_AlertedGuard_ForceGreeter03.ForceRefTo(akSpeaker as ObjectReference)
  CF05_SuspiciousMarineAttackScene.Start()
EndFunction
