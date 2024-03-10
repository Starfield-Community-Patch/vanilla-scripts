ScriptName TestMQ101MineResourceTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Actor PlayerREF

;-- Properties --------------------------------------
LeveledItem Property TestMQ101MineralDeposit Auto

;-- Functions ---------------------------------------

Function GainMinerals()
  PlayerREF.AddItem(TestMQ101MineralDeposit as Form, 1, False)
  Self.Disable(False)
EndFunction

;-- State -------------------------------------------
State hasbeentriggered
EndState

;-- State -------------------------------------------
Auto State waitingForPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == PlayerREF as ObjectReference
      Self.gotoState("hasbeentriggered")
      Self.GainMinerals()
    EndIf
  EndEvent

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
    If akAggressor == PlayerREF as ObjectReference
      Self.gotoState("hasbeentriggered")
      Self.GainMinerals()
    EndIf
  EndEvent

  Event OnInit()
    PlayerREF = Game.GetPlayer()
    Self.RegisterForHitEvent(Self as ScriptObject, PlayerREF as ScriptObject, None, None, -1, -1, -1, -1, True)
  EndEvent
EndState
