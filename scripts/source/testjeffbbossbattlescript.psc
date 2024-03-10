ScriptName TestJeffBBossBattleScript Extends Actor

;-- Variables ---------------------------------------
Bool doneScaling = False
Float myTotalHealth

;-- Properties --------------------------------------
Float Property ScaleThreshold = 0.850000024 Auto Const
Float Property StartTeleportThreshold = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myTotalHealth = Self.getValue(Game.GetHealthAV())
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor == Game.GetPlayer() as ObjectReference
    If Self.getValue(Game.GetHealthAV()) <= myTotalHealth * ScaleThreshold && doneScaling == False
      doneScaling = True
      Self.SendCustomEvent("testjeffbbossbattlescript_ScaleBoss", None)
      Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
    ElseIf Self.getValue(Game.GetHealthAV()) <= myTotalHealth * StartTeleportThreshold
      Self.SendCustomEvent("testjeffbbossbattlescript_StartTeleporting", None)
    Else
      Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
    EndIf
  EndIf
EndEvent

Event onDeath(ObjectReference akKiller)
  Self.SendCustomEvent("testjeffbbossbattlescript_StopTeleporting", None)
EndEvent
