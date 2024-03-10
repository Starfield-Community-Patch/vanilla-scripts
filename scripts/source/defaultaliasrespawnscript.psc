ScriptName defaultAliasRespawnScript Extends ReferenceAlias default
{ Script for respawning this alias.  For use along with a quest that has the DefaultQuestRespawnScript attached to it. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property RespawningOn = True Auto
  { Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE }
EndGroup


;-- Functions ---------------------------------------

Function RespawnIfDead()
  If Self.GetActorRef().IsDead()
    defaultquestrespawnscript myQuest = Self.GetOwningQuest() as defaultquestrespawnscript
    Self.gotoState("respawning")
    myQuest.Respawn(Self as ReferenceAlias)
    Self.gotoState("normal")
  EndIf
EndFunction

;-- State -------------------------------------------
Auto State normal

  Event OnDeath(ObjectReference akKiller)
    If RespawningOn
      defaultquestrespawnscript myQuest = Self.GetOwningQuest() as defaultquestrespawnscript
      Self.gotoState("respawning")
      myQuest.TryToRespawn(Self as ReferenceAlias)
      Self.gotoState("normal")
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State respawning

  Event OnDeath(ObjectReference akKiller)
    ; Empty function
  EndEvent
EndState
