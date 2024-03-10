ScriptName TestMiningPrototype01Script Extends ObjectReference
{ Spawn ore that the player has to pickup }

;-- Variables ---------------------------------------
Int MineralAmount

;-- Properties --------------------------------------
Faction Property CurrentCompanionFaction Auto Const mandatory
MiscObject Property MineralType Auto Const mandatory

;-- Functions ---------------------------------------

Function myRegisterForHit()
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  Self.RegisterForHitEvent(Self as ScriptObject, CurrentCompanionFaction as ScriptObject, None, None, -1, -1, -1, -1, True)
EndFunction

Event OnInit()
  Self.myRegisterForHit()
  MineralAmount = Utility.RandomInt(1, 3)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.GetLinkedRef(None).PlaceAtMe(MineralType as Form, MineralAmount, False, False, True, None, None, True)
  Self.Disable(False)
EndEvent
