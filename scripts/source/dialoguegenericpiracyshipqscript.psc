ScriptName DialogueGenericPiracyShipQScript Extends Quest

;-- Variables ---------------------------------------
Int iPiracy_Lose = 2
Int iPiracy_LoseGU = 3
Int iPiracy_Win = 1

;-- Properties --------------------------------------
ReferenceAlias Property DialogueGenericPiracyShips_Ship Auto Const mandatory
ActorValue Property DialogueGenericPiracyShipsAV Auto Const mandatory
ActorValue Property PiracySurrenderCountAV Auto Const mandatory
{ used to track number of ships that surrender to the player }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Function PiracySuccess(spaceshipreference ShipRef)
  ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_Win as Float)
  ShipRef.OpenInventory()
  Self.SendPiracyAlarm(ShipRef, True)
  Game.GetPlayer().ModValue(PiracySurrenderCountAV, 1.0)
EndFunction

Function PiracyFail(spaceshipreference ShipRef)
  ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_Lose as Float)
  Self.SendPiracyAlarm(ShipRef, False)
  ShipRef.StartCombat(Game.GetPlayer().GetCurrentShipRef(), False)
EndFunction

Function PiracyLoseSpeechChallenge(spaceshipreference ShipRef)
  ShipRef.SetValue(DialogueGenericPiracyShipsAV, iPiracy_LoseGU as Float)
  Self.SendPiracyAlarm(ShipRef, False)
EndFunction

Function SendPiracyAlarm(spaceshipreference ShipRef, Bool PiracySuccess)
  SQ_Parent.SendPiracyEvent(ShipRef as ObjectReference, PiracySuccess)
  ShipRef.SendPiracyAlarm()
EndFunction
