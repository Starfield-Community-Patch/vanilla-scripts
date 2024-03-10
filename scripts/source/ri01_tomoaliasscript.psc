ScriptName RI01_TomoAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property WeaponTypeEM Auto Const mandatory
Int Property StageToSet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If (akAggressor == Game.GetPlayer() as ObjectReference) && akSource.HasKeyword(WeaponTypeEM) != True
    Spell sourceSpell = akSource as Spell
    If sourceSpell == None || sourceSpell.IsHostile()
      Self.GetOwningQuest().SetStage(StageToSet)
    EndIf
  EndIf
EndEvent
