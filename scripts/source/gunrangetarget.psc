ScriptName GunRangeTarget Extends ObjectReference
{ Detects projectiles on hit and sends back score }

;-- Variables ---------------------------------------
ObjectReference Counter

;-- Properties --------------------------------------
Group Optional_Properties
  Int Property ScorePerHit = 1 Auto Const
  { Score earned per hit }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  Counter = Self.GetLinkedRef(None)
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If (Counter as gunrangecounter).QuestToSet.GetCurrentStageID() == (Counter as gunrangecounter).StageToStartCompetition
    (Counter as gunrangecounter).GunRangeCompetition(ScorePerHit)
    Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent
