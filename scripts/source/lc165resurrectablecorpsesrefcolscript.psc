ScriptName LC165ResurrectableCorpsesRefColScript Extends RefCollectionAlias
{ Actors in this Ref Collection are killed on first cell load, and set up to be resurrected during one of the LC165 Battles. }

;-- Variables ---------------------------------------
Int CONST_Aggression_VeryAggressive = 2 Const
Int CONST_Confidence_Foolhardy = 4 Const
Int CONST_CorpseSettleDelay = 2 Const

;-- Properties --------------------------------------
Bool Property ShouldKillOnLoad = True Auto Const
Bool Property ShouldDisableAfterKill = False Auto Const
Faction Property LC165StarbornEnemyFaction Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ActorValue Property LC165_ResurrectableCorpseKilledOnLoadValue Auto Const mandatory
Keyword Property DMP_Combat_FleeTo Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCellLoad(ObjectReference akSenderRef)
  If ShouldKillOnLoad
    Actor sourceActor = akSenderRef as Actor
    If sourceActor != None
      If sourceActor.GetValue(LC165_ResurrectableCorpseKilledOnLoadValue) == 0.0
        sourceActor.Kill(None)
        If ShouldDisableAfterKill
          sourceActor.DisableNoWait(False)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Actor sourceActor = akSenderRef as Actor
  If sourceActor != None
    sourceActor.RemoveFromAllFactions()
    sourceActor.AddToFaction(LC165StarbornEnemyFaction)
    sourceActor.SetValue(Confidence, CONST_Confidence_Foolhardy as Float)
    sourceActor.SetValue(Aggression, CONST_Aggression_VeryAggressive as Float)
    sourceActor.SetValue(LC165_ResurrectableCorpseKilledOnLoadValue, 1.0)
    sourceActor.SetLinkedRef(None, DMP_Combat_FleeTo, True)
  EndIf
EndEvent
