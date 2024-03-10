ScriptName MQ102MoaraShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property DisabledEngineStage = 640 Auto Const
ActorValue Property SpaceshipMainEnginePower Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If akSystem == SpaceshipMainEnginePower && aFullyDamaged
    Self.GetOwningQuest().SetStage(DisabledEngineStage)
  EndIf
EndEvent
