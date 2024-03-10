ScriptName UC04_GuardDeathCount Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC04_AttackActive Auto Const mandatory
{ Global used to track if the attack if still currently active }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If UC04_AttackActive.GetValue() >= 1.0
    (Self.GetOwningQuest() as uc04_questscript).IncrementGuardDeathCount()
  EndIf
EndEvent
