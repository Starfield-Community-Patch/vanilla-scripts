ScriptName LC175_CreatureAmbushScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
Keyword Property LC175_CreatureLinkKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  ObjectReference[] CagedAnimalRef = Self.GetRef().GetLinkedRefChain(LC175_CreatureLinkKeyword, 100)
  Int I = 0
  While I < CagedAnimalRef.Length
    (CagedAnimalRef[I] as Actor).RemoveFromFaction(CaptiveFaction)
    CagedAnimalRef[I].SetValue(Aggression, 1.0)
    I += 1
  EndWhile
EndEvent
