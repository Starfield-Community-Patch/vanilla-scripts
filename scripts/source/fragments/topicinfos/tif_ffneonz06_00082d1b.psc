ScriptName Fragments:TopicInfos:TIF_FFNeonZ06_00082D1B Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Rusty Auto Const
Faction Property PlayerEnemyFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Rusty.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Rusty.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  Rusty.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0)
EndFunction
