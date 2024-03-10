ScriptName TestNPCSetFaction Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const mandatory
FormList Property FactionClassesFormList Auto Const mandatory
Int Property TeamNumber Auto Const mandatory
{ 1. Red Team, 2. Blue Team }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  (SpawnController as testnpcarenascript).SetFactionToSpawn(FactionClassesFormList, TeamNumber)
EndEvent
