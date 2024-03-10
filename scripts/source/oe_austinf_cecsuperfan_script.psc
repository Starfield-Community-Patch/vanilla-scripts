ScriptName OE_AustinF_CECSuperfan_Script Extends ReferenceAlias

;-- Variables ---------------------------------------
Float LowHealth
Actor PlayerREF
Quest QO
Actor Superfan

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const
Scene Property OE_AustinF_CECSuperfan_Scene03 Auto Const
Int Property StageToSet_WeaponsUsed = 170 Auto Const
Int Property StageToSet_PlayerWins = 300 Auto Const
Float Property StopBelowPercentHealth = 0.75 Auto Const
Weapon Property UnarmedHuman Auto

;-- Functions ---------------------------------------

Event OnAliasInit()
  Superfan = Self.GetActorRef()
  QO = Self.GetOwningQuest()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  LowHealth = Superfan.GetValue(Game.GetHealthAV())
  LowHealth *= StopBelowPercentHealth
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akSource != UnarmedHuman as Form
    QO.SetStage(StageToSet_WeaponsUsed)
  EndIf
  If Superfan.GetValue(Game.GetHealthAV()) <= LowHealth
    QO.SetStage(StageToSet_PlayerWins)
  EndIf
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent
