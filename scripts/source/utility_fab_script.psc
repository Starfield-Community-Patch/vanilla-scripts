ScriptName Utility_FAB_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function AttackPlayer(Actor aHostile)
  aHostile.RemoveFromAllFactions()
  aHostile.SetValue(Aggression, 1.0)
  aHostile.AddtoFaction(PlayerEnemyFaction)
  aHostile.StartCombat(Game.GetPlayer() as ObjectReference, False)
  aHostile.SetEssential(False)
  aHostile.EvaluatePackage(False)
EndFunction

Function ShipAttackPlayer(spaceshipreference sHostile)
  sHostile.RemoveFromAllFactions()
  sHostile.SetValue(Aggression, 1.0)
  sHostile.AddtoFaction(PlayerEnemyFaction)
  sHostile.StartCombat(Game.GetPlayer().GetCurrentShipRef(), False)
  sHostile.SetEssential(False)
  sHostile.EvaluatePackage(False)
EndFunction
