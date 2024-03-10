ScriptName Fragments:TopicInfos:TIF_TraitQuest_001676AB Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property TraitSpaced Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().RemovePerk(TraitSpaced)
EndFunction
