ScriptName GenericBrawlOpponentAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
genericbrawlscript myQuest

;-- Properties --------------------------------------
Int Property BrawlUpdateTimerID = 1 Auto Const
Float Property BrawlUpdateTime = 2.0 Auto Const
Faction Property GenericBrawlFaction Auto

;-- Functions ---------------------------------------

Event OnAliasInit()
  myQuest = Self.GetOwningQuest() as genericbrawlscript
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Self.RegisterForMagicEffectApplyEvent(Self as ScriptObject, None, None, True)
EndEvent

Function StartUpdateTimer(Bool bStartTimer)
  If bStartTimer
    Self.StartTimer(BrawlUpdateTime, BrawlUpdateTimerID)
  Else
    Self.CancelTimer(BrawlUpdateTimerID)
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == BrawlUpdateTimerID
    Actor pActor = Self.GetActorRef()
    If pActor.IsInCombat() == False && pActor.IsBleedingOut() == 0 && myQuest.GetStage() < 15
      myQuest.SetStage(myQuest.PlayerDefeatedStage)
    Else
      Self.StartTimer(BrawlUpdateTime, BrawlUpdateTimerID)
    EndIf
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Actor pActor = Self.GetActorRef()
  Actor pPlayer = Game.GetPlayer()
  If (akAggressor == pPlayer as ObjectReference) || myQuest.PlayerAllies.Find(akAggressor) > -1
    If akProjectile as Bool || (akWeapon as Bool && (akWeapon != myQuest.Unarmed as Form))
      pPlayer.RemoveFromFaction(GenericBrawlFaction)
      pActor.RemoveFromFaction(GenericBrawlFaction)
      pActor.StopCombat()
      pActor.SendAssaultAlarm()
      pActor.StartCombat(Game.GetPlayer() as ObjectReference, False)
      myQuest.SetStage(myQuest.CheatingStage)
    Else
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    EndIf
  Else
    myQuest.SetStage(myQuest.CheatingStage)
  EndIf
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  If (akCaster == Game.GetPlayer() as ObjectReference) || myQuest.PlayerAllies.Find(akCaster) > -1
    myQuest.SetStage(myQuest.CheatingStage)
  EndIf
EndEvent

Event OnEnterBleedout()
  myQuest.SetStage(myQuest.PlayerWinsStage)
  Self.GetActorReference().EvaluatePackage(False)
EndEvent
