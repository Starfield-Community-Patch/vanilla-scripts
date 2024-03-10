ScriptName TestCryoTankExplode Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ExplosionFireHazardSpell Auto Const
Explosion Property fragGrenadeExplosion Auto Const

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
  Self.PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True)
  Self.FreezeIce()
EndEvent

Function FreezeIce()
  ObjectReference IceLinked = Self.GetLinkedRef(None)
  Float MaxScale = IceLinked.GetScale()
  IceLinked.SetScale(0.01)
  Float currentScale = IceLinked.GetScale()
  While currentScale <= MaxScale - 0.200000003
    Utility.Wait(0.100000001)
    IceLinked.SetScale(currentScale * 1.200000048)
    currentScale = IceLinked.GetScale()
  EndWhile
  IceLinked.SetScale(MaxScale)
  Self.UnregisterForAllHitEvents(None)
EndFunction
