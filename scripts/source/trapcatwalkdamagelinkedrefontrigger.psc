ScriptName TrapCatwalkDamageLinkedRefonTrigger Extends ObjectReference Const
{ Damages linked object when trigger is entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property damageAmount = 200.0 Auto Const
wwiseevent Property WwiseEvent_TRP_Catwalk_Creak_OneShot Auto Const
Float Property TimeToBreak = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  WwiseEvent_TRP_Catwalk_Creak_OneShot.Play(Self.GetLinkedRef(None), None, None)
  Self.StartTimer(TimeToBreak, 0)
EndEvent

Event OnTimer(Int aiTimerID)
  Self.GetLinkedRef(None).DamageObject(damageAmount)
  Self.disable(False)
EndEvent
