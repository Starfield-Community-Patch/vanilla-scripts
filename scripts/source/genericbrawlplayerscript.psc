ScriptName GenericBrawlPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
genericbrawlscript myQuest

;-- Functions ---------------------------------------

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
  If akCaster != Game.GetPlayer() as ObjectReference
    myQuest.SetStage(myQuest.CheatingStage)
  EndIf
EndEvent

Event OnEnterBleedout()
  myQuest.SetStage(myQuest.PlayerDefeatedStage)
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If Game.GetPlayer().IsInLocation(myQuest.Opponent.GetActorRef().GetCurrentLocation()) == False
    myQuest.SetStage(myQuest.EndBrawlStage)
  EndIf
EndEvent
