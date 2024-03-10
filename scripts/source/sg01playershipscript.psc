ScriptName SG01PlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ShipSystem Auto Const

;-- Functions ---------------------------------------

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If akSystem == ShipSystem && aFullyDamaged && Self.GetOwningQuest().GetStageDone(700)
    Self.GetOwningQuest().SetStage(750)
  EndIf
EndEvent
