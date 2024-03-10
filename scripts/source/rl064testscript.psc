ScriptName RL064TestScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ExplosionFireHazardSpell Auto Const
ObjectReference Property IceLinked Auto
Explosion Property fragGrenadeExplosion Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded()
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    IceLinked = Self.GetLinkedRef(None)
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True)
  Self.MeltIce()
EndEvent

Function MeltIce()
  Float currentScale = IceLinked.GetScale()
  While currentScale >= 0.100000001
    Utility.Wait(0.100000001)
    IceLinked.SetScale(currentScale * 0.899999976)
    currentScale = IceLinked.GetScale()
  EndWhile
  IceLinked.Disable(False)
  Self.UnregisterForAllHitEvents(None)
EndFunction
