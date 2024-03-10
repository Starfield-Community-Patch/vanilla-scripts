ScriptName LvlStarbornScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ffStarbornTeleport Auto Const mandatory
Spell Property ffStarbornDeath Auto Const mandatory
ActorValue Property QuantumEssence Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function
EndEvent

Event OnDying(ObjectReference akKiller)
  Self.BlockActivation(True, True)
  Starborn_DeathShader.Play(Self as ObjectReference, -1.0)
EndEvent

Event OnDeath(ObjectReference akKiller)
  If (akKiller as Actor).IsPlayerTeammate()
    FortifyQuantumEssenceSpell.Cast(Self as ObjectReference, Game.GetPlayer() as ObjectReference)
  Else
    FortifyQuantumEssenceSpell.Cast(Self as ObjectReference, akKiller)
  EndIf
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Utility.Wait(5.0)
  Self.Disable(False)
EndEvent

Function TeleportIn()
  ffStarbornTeleport.Cast(Self as ObjectReference, Self as ObjectReference)
EndFunction

Function TeleportOut()
  ffStarbornDeath.Cast(Self as ObjectReference, Self as ObjectReference)
EndFunction

;-- State -------------------------------------------
State HasLoaded

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForLoad

  Event OnLoad()
    Self.GotoState("HasLoaded")
    ffStarbornTeleport.Cast(Self as ObjectReference, Self as ObjectReference)
  EndEvent
EndState
