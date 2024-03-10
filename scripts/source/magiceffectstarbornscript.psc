ScriptName MagicEffectStarbornScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ffStarbornTeleport Auto Const mandatory
Spell Property ffStarbornDeath Auto Const mandatory
ActorValue Property QuantumEssence Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory
Keyword Property NoLoot Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnLoad(ObjectReference akSender)
  ; Empty function
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ffStarbornTeleport.Cast(akCaster as ObjectReference, akCaster as ObjectReference)
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnLoad")
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnDying")
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnDeath")
EndEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
  akSender.BlockActivation(True, True)
  Starborn_DeathShader.Play(akSender as ObjectReference, 5.0)
  If !akSender.HasKeyword(NoLoot)
    If (akKiller as Actor).IsPlayerTeammate()
      FortifyQuantumEssenceSpell.Cast(akSender as ObjectReference, Game.GetPlayer() as ObjectReference)
    Else
      FortifyQuantumEssenceSpell.Cast(akSender as ObjectReference, akKiller)
    EndIf
    QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  Utility.Wait(6.0)
  akSender.Disable(False)
EndEvent

;-- State -------------------------------------------
State HasLoaded

  Event ObjectReference.OnLoad(ObjectReference akSender)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForLoad

  Event ObjectReference.OnLoad(ObjectReference akSender)
    Self.GotoState("HasLoaded")
    ffStarbornTeleport.Cast(akSender, akSender)
  EndEvent
EndState
