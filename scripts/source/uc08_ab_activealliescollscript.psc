ScriptName UC08_AB_ActiveAlliesCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
Bool bDoOnce
Int iKillCount

;-- Properties --------------------------------------
Int Property WrapUpStage = 900 Auto Const
{ Stage denoting the sequence is done }
Faction Property UC08_PlayerAlignedNPCAllyFaction Auto Const mandatory
{ Faction applied to the player's allied critters }
Faction Property PlayerAllyFaction Auto Const mandatory
{ Faction applied to the player's allied critters }
Faction Property PlayerEnemyFaction Auto Const mandatory
{ Faction applied to the player's allied critters if the player kills any of them after the fight }
Int Property iFreebieCount = 1 Auto Const
{ How many free kills I'll let the player get before turning the NPCs on the player }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef)
  If !bDoOnce && (akKiller == Game.GetPlayer() as ObjectReference) && Self.GetOwningQuest().GetStageDone(WrapUpStage)
    If iKillCount < iFreebieCount
      iKillCount += 1
    Else
      bDoOnce = True
      Self.TurnAlliesToFoes()
    EndIf
  EndIf
EndEvent

Function TurnAlliesToFoes()
  Int I = 0
  Int iCount = Self.GetCount()
  While I < iCount
    Actor currACT = Self.GetAt(I) as Actor
    currACT.RemoveFromFaction(UC08_PlayerAlignedNPCAllyFaction)
    currACT.RemoveFromFaction(PlayerAllyFaction)
    currACT.AddToFaction(PlayerEnemyFaction)
    I += 1
  EndWhile
EndFunction
