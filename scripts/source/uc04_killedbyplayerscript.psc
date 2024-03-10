ScriptName UC04_KilledByPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC04_AttackActive Auto Const mandatory
{ Global used to track if the attack if still currently active }
Int Property StagetoSet = 730 Auto Const
{ Stage to set if this NPC was killed by the player }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  If UC04_AttackActive.GetValue() >= 1.0
    If akKiller == Game.GetPlayer() as ObjectReference
      Self.GetOwningQuest().SetStage(StagetoSet)
    EndIf
  EndIf
EndEvent
