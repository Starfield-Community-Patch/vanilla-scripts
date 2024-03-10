ScriptName Mq304BAquilusScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property QuantumEssence Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  Actor SelfREF = Self.GetActorRef()
  SelfREF.BlockActivation(True, True)
  Starborn_DeathShader.Play(SelfREF as ObjectReference, 5.0)
  If (akKiller as Actor).IsPlayerTeammate()
    FortifyQuantumEssenceSpell.Cast(SelfREF as ObjectReference, Game.GetPlayer() as ObjectReference)
  Else
    FortifyQuantumEssenceSpell.Cast(SelfREF as ObjectReference, akKiller)
  EndIf
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndEvent

Event OnDeath(ObjectReference akKiller)
  Utility.Wait(6.0)
  Self.GetActorRef().Disable(False)
EndEvent
