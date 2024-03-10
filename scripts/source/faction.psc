ScriptName Faction Extends Form Native hidden

;-- Functions ---------------------------------------

Bool Function CanPayCrimeGold() Native

Int Function GetCrimeGold() Native

Int Function GetCrimeGoldNonViolent() Native

Int Function GetCrimeGoldViolent() Native

Int Function GetFactionReaction(Actor akOther) Native

Int Function GetInfamy() Native

Int Function GetInfamyNonViolent() Native

Int Function GetInfamyViolent() Native

Int Function GetStolenItemValueCrime() Native

Int Function GetStolenItemValueNoCrime() Native

Bool Function IsFactionInCrimeGroup(Faction akOther) Native

Bool Function IsPlayerEnemy() Native

Bool Function IsPlayerExpelled() Native

Function ModCrimeGold(Int aiAmount, Bool abViolent) Native

Function PlayerPayCrimeGold(Bool abRemoveStolenItems, Bool abGoToJail) Native

Function RemovePlayerContrabandAndStolenItems() Native

Function SendAssaultAlarm() Native

Function SendPlayerToJail(Bool abRemoveInventory, Bool abRealJail) Native

Function SetAlly(Faction akOther, Bool abSelfIsFriendToOther, Bool abOtherIsFriendToSelf) Native

Function SetCrimeGold(Int aiGold) Native

Function SetCrimeGoldViolent(Int aiGold) Native

Function SetEnemy(Faction akOther, Bool abSelfIsNeutralToOther, Bool abOtherIsNeutralToSelf) Native

Function SetPlayerEnemy(Bool abIsEnemy) Native

Function SetPlayerExpelled(Bool abIsExpelled) Native
