ScriptName AddFactionToLinkedRefOnTrigger Extends ObjectReference Const
{ Add Faction to linked actors on trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property FactionToAdd Auto Const mandatory
Keyword Property LinkKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  ObjectReference[] LinkedRefs = Self.GetLinkedRefChain(LinkKeyword, 100)
  Int I = 0
  While I < LinkedRefs.Length
    (LinkedRefs[I] as Actor).AddToFaction(FactionToAdd)
    I += 1
  EndWhile
EndEvent
