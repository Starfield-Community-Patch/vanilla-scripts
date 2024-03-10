ScriptName BQ01_BarrettScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property Location_Temple Auto Const mandatory
Keyword Property BQ01_Keyword_TempleLocation Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Location_Temple.GetLocation().AddKeyword(BQ01_Keyword_TempleLocation)
EndEvent
