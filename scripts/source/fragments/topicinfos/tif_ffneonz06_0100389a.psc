ScriptName Fragments:TopicInfos:TIF_FFNeonZ06_0100389A Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Rusty Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Rusty.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  Rusty.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0)
EndFunction
