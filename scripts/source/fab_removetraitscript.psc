ScriptName FAB_RemoveTraitScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property PerkToRemove Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Game.GetPlayer().RemovePerk(PerkToRemove)
EndEvent
