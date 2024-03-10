ScriptName GenericBrawlAlliesScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
genericbrawlscript myQuest

;-- Functions ---------------------------------------

Event OnEnterBleedout(ObjectReference akSenderRef)
  ; Empty function
EndEvent

Event OnAliasInit()
  myQuest = Self.GetOwningQuest() as genericbrawlscript
  Self.RegisterForHitEvent(Self as ScriptObject, myQuest.Opponent as ScriptObject, None, None, -1, -1, -1, -1, False)
  Self.RegisterForHitEvent(Self as ScriptObject, myQuest.OpponentFriend as ScriptObject, None, None, -1, -1, -1, -1, False)
  Self.RegisterForMagicEffectApplyEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, False)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akAggressor != myQuest.Opponent.GetRef() && akAggressor != myQuest.OpponentFriend.GetRef()
    myQuest.SetStage(myQuest.EndBrawlStage)
  Else
    Self.RegisterForHitEvent(Self as ScriptObject, myQuest.Opponent as ScriptObject, None, None, -1, -1, -1, -1, False)
    Self.RegisterForHitEvent(Self as ScriptObject, myQuest.OpponentFriend as ScriptObject, None, None, -1, -1, -1, -1, False)
  EndIf
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  If akCaster != akTarget
    myQuest.SetStage(myQuest.CheatingStage)
  EndIf
EndEvent
