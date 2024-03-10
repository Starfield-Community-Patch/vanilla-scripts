ScriptName LC012_CreatureAttackTrigger Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property MQ202PetrovEnemyFaction Auto Const
{ Faction to add to the creature }
Faction Property MQ202PetrovFaction Auto Const
{ Faction to remove from the creature }
Keyword Property LinkCustom01 Auto Const
{ Link to the chain of creatures from the door }
ActorValue Property LC012_CreatureAttack Auto Const
{ The Actor value to set, used by the LC012_CreatureAttackPackage }

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  ObjectReference[] LinkedRefs = Self.GetLinkedRefChain(LinkCustom01, 100)
  Int I = 0
  While I < LinkedRefs.Length
    LinkedRefs[I].SetValue(LC012_CreatureAttack, 1.0)
    (LinkedRefs[I] as Actor).RemoveFromFaction(MQ202PetrovFaction)
    (LinkedRefs[I] as Actor).AddToFaction(MQ202PetrovEnemyFaction)
    (LinkedRefs[I] as Actor).EvaluatePackage(False)
    I += 1
  EndWhile
EndEvent
