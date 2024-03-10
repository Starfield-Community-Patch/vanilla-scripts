ScriptName MQ204HunterScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory
Int Property HunterDamagedStage = 700 Auto Const
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const
EffectShader Property Starborn_DeathShader Auto Const
ObjectReference Property MQHoldingCellCenterMarker Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor HunterREF = Self.GetActorRef()
  Float iHalfHealth = HunterREF.GetValue(Health) / 2.0
  Self.RegisterForActorValueLessThanEvent(Self.GetActorRef() as ObjectReference, Health, iHalfHealth)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Actor HunterREF = Self.GetActorRef()
  HunterREF.SetUnconscious(True)
  HunterREF.BlockActivation(True, True)
  HunterREF.StopCombat()
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
  Starborn_DeathShader.Play(HunterREF as ObjectReference, -1.0)
  Utility.Wait(3.0)
  HunterREF.Disable(False)
  HunterREF.Moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False)
  HunterREF.ResetHealthAndLimbs()
  Float iHalfHealth = HunterREF.GetValue(Health) / 2.0
  Self.RegisterForActorValueLessThanEvent(Self.GetActorRef() as ObjectReference, Health, iHalfHealth)
  HunterREF.SetUnconscious(False)
  HunterREF.BlockActivation(False, False)
  HunterREF.Enable(False)
  Self.GetOwningQuest().SetStage(HunterDamagedStage)
EndEvent
