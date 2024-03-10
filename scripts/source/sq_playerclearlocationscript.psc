ScriptName SQ_PlayerClearLocationScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property SQ_ClearedLocationCount Auto Const mandatory
{ count how many locations the player has cleared }
Keyword[] Property KeywordsToCheck Auto Const
{ dungeon will be counted if it has any of these keywords }

;-- Functions ---------------------------------------

Event OnStoryExploredLocation(Location akOldLocation)
  Int I = 0
  Bool locationCounts = False
  While I < KeywordsToCheck.Length && locationCounts == False
    locationCounts = akOldLocation.HasKeyword(KeywordsToCheck[I])
    I += 1
  EndWhile
  If locationCounts
    SQ_ClearedLocationCount.Mod(1.0)
  EndIf
  Self.Stop()
EndEvent
