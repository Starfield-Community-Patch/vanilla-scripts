ScriptName ImprovingSwordSCRIPT Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property pImprovingSword Auto

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  pImprovingSword.setValue(pImprovingSword.getValue() + 1.0)
EndEvent
