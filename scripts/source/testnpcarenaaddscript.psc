ScriptName TestNPCArenaAddScript Extends ObjectReference Const
{ Adds a specific NPC to one of the teams. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property ArenaController Auto Const mandatory
Int Property TypeToAdd Auto Const
{ 0. Assault, 1. Charger, 2. Heavy, 3. Officer, 4. Recruit, 5. Sniper, 6. Support }
Int Property TeamToAddTo Auto Const mandatory
{ 1. Red Team, 2. Blue Team }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  (ArenaController as testnpcarenascript).AddSpecificNPC(TypeToAdd, TeamToAddTo)
EndEvent
