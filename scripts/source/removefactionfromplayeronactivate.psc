Scriptname RemoveFactionFromPlayerOnActivate extends ObjectReference Const

Faction property FactionToAdd auto Const

Event OnActivate(ObjectReference akActionRef)
    if(akActionRef == Game.GetPlayer())
        Actor player = Game.GetPlayer()

        player.RemoveFromFaction(FactionToAdd)
    EndIf
EndEvent