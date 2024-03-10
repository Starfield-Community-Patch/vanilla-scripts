ScriptName DefaultRefSurfaceBoardingEncounter Extends SpaceshipReference default
{ Script for ships on the surface of a planet. When the ship lands, start a Boarding Encounter to manage the crew in the ship's interior. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AliasProperties
  Float Property CrewSizePercent = 1.0 Auto Const
  { DEFAULT=1.0. Multiply the Boarding Encounter's base crew and corpse counts by this value.
	For example, if your encounter spawns actors outside the ship to fight the player, you might want half the usual crew in the ship (0.5).
	Note that reducing a ship's crew size with this multiplier also reduces its default loot accordingly. }
EndGroup

Group AutofillProperties collapsedonbase
  Keyword Property BEEncounterTypeSurface Auto Const mandatory
EndGroup

Quest Property myBoardingEncounterQuest Auto hidden

;-- Functions ---------------------------------------

Event OnShipLanding(Bool abComplete)
  If abComplete
    BEEncounterTypeSurface.SendStoryEventAndWait(None, None, Self as ObjectReference, (CrewSizePercent * 100.0) as Int, 0)
  EndIf
EndEvent
