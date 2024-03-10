ScriptName CF01QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionUC Auto Const mandatory
{ UC crime faction for handling jail/bounty/etc. }

;-- Functions ---------------------------------------

Function SendPlayerToJail()
  CrimeFactionUC.SendPlayerToJail(True, False)
EndFunction

Function ModCrimeGold(Int amount)
  CrimeFactionUC.ModCrimeGold(amount, False)
EndFunction

Function RemovePlayerContraband()
  CrimeFactionUC.RemovePlayerContrabandAndStolenItems()
EndFunction
