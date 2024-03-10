ScriptName AddFactionToPlayerOnActivate Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionToAdd Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Actor player = Game.GetPlayer()
    player.AddToFaction(FactionToAdd)
  EndIf
EndEvent
