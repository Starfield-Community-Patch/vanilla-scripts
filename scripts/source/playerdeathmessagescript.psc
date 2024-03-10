ScriptName PlayerDeathMessageScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const
Float Property Damaged Auto Const
Message Property PlayerDeathMessage Auto Const
Spell Property abDeathMessage Auto Const
GlobalVariable Property MessageBoxTutorialBlocked Auto Const
GlobalVariable Property MessageBoxTutorialWait Auto Const
Quest Property Tutorial Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akVictim, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  If akTarget == Game.GetPlayer() as ObjectReference
    If PlayerRef.GetValuePercentage(Health) < Damaged && PlayerRef.GetValue(Health) > 0.0
      MessageBoxTutorialBlocked.SetValue(1.0)
      PlayerDeathMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Self.UnregisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True)
      Game.GetPlayer().RemoveSpell(abDeathMessage)
      Utility.Wait(MessageBoxTutorialWait.GetValue())
      MessageBoxTutorialBlocked.SetValue(0.0)
    Else
      Self.RegisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    EndIf
  EndIf
EndEvent
