ScriptName DefaultActivateSelfOnHit Extends Actor default
{ The ref activates itself on hit, typically to trigger an ambush from an ActivateParented actor. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property DoOnce = True Auto Const

;-- Functions ---------------------------------------

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

;-- State -------------------------------------------
State Done

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    Self.Activate(Self as ObjectReference, False)
    If DoOnce
      Self.GoToState("Done")
    Else
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    EndIf
  EndEvent

  Event OnLoad()
    If Self.Is3DLoaded()
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    EndIf
  EndEvent
EndState
