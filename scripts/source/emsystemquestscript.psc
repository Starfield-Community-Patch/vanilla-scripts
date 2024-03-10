ScriptName EMSystemQuestScript Extends Quest hidden

;-- Variables ---------------------------------------
Int ActorsActive
Int ActorsTotal
Int EncountersActive
Int EncountersInactive
Int EncountersLoaded
Int EncountersTotal

;-- Functions ---------------------------------------

Function IncrementTotal()
  EncountersTotal += 1
EndFunction

Function DecrementTotal()
  EncountersTotal -= 1
EndFunction

Function IncrementActive()
  EncountersActive += 1
EndFunction

Function DecrementActive()
  EncountersActive -= 1
EndFunction

Function UpdateInactive()
  EncountersInactive = EncountersTotal - EncountersActive
EndFunction

Function IncrementLoaded()
  EncountersLoaded += 1
EndFunction

Function DecrementLoaded()
  EncountersLoaded -= 1
EndFunction

Function AddToActorsActive(Int AmountToAdd)
  ActorsActive += AmountToAdd
EndFunction

Function SubtractFromActorsActive(Int AmounttoSubtract)
  ActorsActive -= AmounttoSubtract
EndFunction

Function AddToActorsTotal(Int AmountToAdd)
  ActorsTotal += AmountToAdd
EndFunction

Function SubtractFromActorsTotal(Int AmounttoSubtract)
  ActorsTotal -= AmounttoSubtract
EndFunction

Function UpdateActorsTotal(Int AmounttoSubtract, Int AmountToAdd)
  ActorsTotal -= AmounttoSubtract
  ActorsTotal += AmountToAdd
EndFunction

Function UpdateActorsActive(Int AmounttoSubtract, Int AmountToAdd)
  ActorsActive -= AmounttoSubtract
  ActorsActive += AmountToAdd
EndFunction
