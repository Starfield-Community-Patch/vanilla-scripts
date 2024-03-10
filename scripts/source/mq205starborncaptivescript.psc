ScriptName MQ205StarbornCaptiveScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Function RegisterForHits()
  Self.RegisterForHitEvent(Self.GetActorRef() as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
EndFunction

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor == Game.GetPlayer() as ObjectReference
    Quest MQ205Quest = Self.GetOwningQuest()
    If MQ205Quest.GetStageDone(310) && MQ205Quest.GetStageDone(315) == False
      MQ205Quest.SetStage(315)
    ElseIf MQ205Quest.GetStageDone(320) && MQ205Quest.GetStageDone(325) == False
      MQ205Quest.SetStage(325)
    ElseIf MQ205Quest.GetStageDone(330) && MQ205Quest.GetStageDone(350) == False
      MQ205Quest.SetStage(350)
    EndIf
  EndIf
EndEvent
