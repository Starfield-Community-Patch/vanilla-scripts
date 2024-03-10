ScriptName LC088_VigilanceEnemyRefColScript Extends RefCollectionAlias
{ Essentially a variant of DefaultCollectionAliasOnDeath for LC088_Vigilance.
The quest script calls RemoveEnemyRef to remove robots and turrets the player has hacked or otherwise disabled
as part of a quest event, something not supported by the standard default script. }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard EnemyRefColGuard

;-- Properties --------------------------------------
Int Property StageToSet = -1 Auto Const mandatory
{ Stage to set when all enemies have been killed or otherwise removed from the collection. }
Bool Property UseOnDyingInstead = False Auto Const
{ Default=False. Use the OnDying event, instead of OnDeath? }

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akSenderRef, ObjectReference akKiller)
  If UseOnDyingInstead
    Self.RemoveEnemyRef(akSenderRef)
  EndIf
EndEvent

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If !UseOnDyingInstead
    Self.RemoveEnemyRef(akSenderRef)
  EndIf
EndEvent

Function RemoveEnemyRef(ObjectReference refToRemove)
  Guard EnemyRefColGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.RemoveRef(refToRemove)
    If Self.GetCount() == 0
      Self.GetOwningQuest().SetStage(StageToSet)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
