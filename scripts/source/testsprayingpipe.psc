ScriptName TestSprayingPipe Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weapon Property UnarmedHuman Auto Const
Form Property FireMed01 Auto Const
Hazard Property ENV_GasVentHazard_ToxicGas_Small Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded()
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If abBashAttack || (akSource == UnarmedHuman as Form)
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Else
    Self.PlaceAtMe(FireMed01, 1, False, False, True, None, None, True)
    Self.GetLinkedRef(None).Enable(False)
  EndIf
EndEvent
