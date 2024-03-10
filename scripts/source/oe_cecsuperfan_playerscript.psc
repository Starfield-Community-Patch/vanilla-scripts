ScriptName OE_CECSuperfan_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Float LowHealth
Actor PlayerREF

;-- Properties --------------------------------------
Float Property StopBelowPercentHealth = 0.75 Auto Const
{ If the Player's health reaches this percent, they lose the fight. Range: 0.01 - 0.99 }
Int Property StageToSet = 400 Auto Const
{ Stage to set when the Player loses. }
ReferenceAlias Property ShipA Auto Const hidden mandatory
{ Autofill }

;-- Functions ---------------------------------------

Event OnAliasInit()
  PlayerREF = Self.GetActorRef()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  LowHealth = PlayerREF.GetValue(Game.GetHealthAV())
  LowHealth *= StopBelowPercentHealth
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Quest QO = Self.GetOwningQuest()
  Float PlayerHealth = PlayerREF.GetValue(Game.GetHealthAV())
  If PlayerHealth <= LowHealth
    QO.SetStage(StageToSet)
  EndIf
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent
