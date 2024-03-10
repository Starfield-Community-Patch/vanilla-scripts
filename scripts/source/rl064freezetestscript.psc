ScriptName RL064FreezeTestScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property IceLinked Auto
{ Linked ref from Canister to ice }
Explosion Property fragGrenadeExplosion Auto Const
{ Test Explosion that triggers on hit }
Keyword Property RL064_Freeze Auto Const
{ Keyword on linked ref to tell that ice should freeze }
Keyword Property RL064_Melt Auto Const
{ Keyword on linked ref to tell that ice should melt }
Bool Property isFreeze Auto
{ If True, ice will freeze. If false, ice will melt }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded()
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    If Self.GetLinkedRef(RL064_Freeze)
      IceLinked = Self.GetLinkedRef(RL064_Freeze)
      isFreeze = True
    EndIf
    If Self.GetLinkedRef(RL064_Melt)
      IceLinked = Self.GetLinkedRef(RL064_Melt)
      isFreeze = False
    EndIf
  EndIf
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True)
  If isFreeze == True
    Self.FreezeIce()
  EndIf
  If isFreeze == False
    Self.MeltIce()
  EndIf
EndEvent

Function FreezeIce()
  Float currentScale = IceLinked.GetScale()
  IceLinked.Enable(False)
  IceLinked.SetScale(0.100000001)
  While currentScale <= 0.449999988
    Utility.Wait(0.100000001)
    IceLinked.SetScale(currentScale * 1.200000048)
    currentScale = IceLinked.GetScale()
  EndWhile
  IceLinked.SetScale(0.5)
  Self.UnregisterForAllHitEvents(None)
EndFunction

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
