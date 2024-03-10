ScriptName RL040RadioOnHitScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myEnableMarker Auto Const mandatory
ObjectReference Property PirateSceneTrigger Auto Const mandatory
wwiseevent Property sSparkEvent Auto Const mandatory
Explosion Property ElectricalExplosionSmall Auto Const mandatory
Quest Property RL040Quest Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(3.0)
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(Self as ScriptObject)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  sSparkEvent.Play(Self as ObjectReference, None, None)
  PirateSceneTrigger.DisableNoWait(False)
  myEnableMarker.EnableNoWait(False)
  RL040Quest.SetStage(30)
EndEvent
