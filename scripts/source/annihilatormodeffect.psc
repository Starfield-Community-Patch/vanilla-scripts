ScriptName AnnihilatorModEffect Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property AnnihilatorSpawnHazardSelf Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  Actor target = Self.GetTargetActor()
  AnnihilatorSpawnHazardSelf.Cast(target as ObjectReference, target as ObjectReference)
  Self.Dispel()
EndEvent
