ScriptName City_AkilaLife01_ThiefScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_AkilaLife01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If Self.GetActorRef().IsBleedingout() > 0
    City_AkilaLife01.SetStage(160)
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Else
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent
