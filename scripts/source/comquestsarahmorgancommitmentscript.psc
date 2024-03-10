ScriptName COMQuestSarahMorganCommitmentScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property GameDaysPassed Auto Const mandatory
GlobalVariable Property COM_Quest_SarahMorgan_Commitment_Time Auto Const mandatory
LocationAlias Property LeavingLocationAlias Auto Const mandatory
Int Property PlayerLeftParadisoStage = 1000 Auto Const
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Function StartAbigailLeave()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip as ScriptObject, "OnLocationChange")
EndFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() && GameDaysPassed.GetValue() >= COM_Quest_SarahMorgan_Commitment_Time.GetValue()
    If akOldLoc == LeavingLocationAlias.GetLocation() || akNewLoc == LeavingLocationAlias.GetLocation()
      Self.SetStage(PlayerLeftParadisoStage)
    EndIf
  EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == SQ_PlayerShip.PlayerShip && GameDaysPassed.GetValue() >= COM_Quest_SarahMorgan_Commitment_Time.GetValue()
    If akOldLoc == LeavingLocationAlias.GetLocation() || akNewLoc == LeavingLocationAlias.GetLocation()
      Self.SetStage(PlayerLeftParadisoStage)
    EndIf
  EndIf
EndEvent
