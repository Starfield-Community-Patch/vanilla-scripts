ScriptName TestTrackTargetOnHitScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Projectile Property TestTrackingProjectile Auto Const mandatory
EffectShader Property ShipShieldMembraneFXS Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(3.0)
  Self.AddInventoryEventFilter(None)
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Self.GotoState("WaitingForHit")
EndEvent

;-- State -------------------------------------------
State WaitingForCorpseLoot

  Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
    ShipShieldMembraneFXS.Stop(Self as ObjectReference)
  EndEvent
EndState

;-- State -------------------------------------------
State WaitingForDeath

  Event OnDying(ObjectReference akKiller)
    If Self.GetItemCount(None) > 0
      ShipShieldMembraneFXS.Play(Self as ObjectReference, -1.0)
    EndIf
    Self.GotoState("WaitingForCorpseLoot")
  EndEvent
EndState

;-- State -------------------------------------------
State WaitingForHit

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    If akProjectile == TestTrackingProjectile
      Self.GotoState("WaitingForDeath")
    EndIf
  EndEvent
EndState
