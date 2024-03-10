ScriptName MQ102PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property LC099NovaShipyardLocation Auto Const mandatory
Faction Property EclipticFaction Auto Const mandatory
Int Property EclipticCommentStage = 540 Auto Const

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnKill(ObjectReference akVictim)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnKill(ObjectReference akVictim)
    If (akVictim as Actor).IsInFaction(EclipticFaction) && Game.GetPlayer().IsInLocation(LC099NovaShipyardLocation)
      Self.GotoState("HasBeenTriggered")
      Self.GetOwningQuest().SetStage(EclipticCommentStage)
    EndIf
  EndEvent
EndState
