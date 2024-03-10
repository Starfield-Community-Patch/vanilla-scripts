ScriptName LegendaryCreatureItemEffectScript Extends ActiveMagicEffect
{ Adds a legendary item

NOTE: This spell effect is on an ability on the RACE of actors that can have Legendary versions.
The spell effect has a condition that the creatue has the EncTypeLegendary keyword. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
legendaryitemquestscript Property LegendaryItemQuest Auto Const
{ AUTOFILL }
LeveledItem Property LeveledListOfItemsToSpawn Auto Const
{ If set, use this leveled list when creating items. Otherwise use the default set on LegendaryItemQuestScript }
FormList Property ListOfSpecificModsToChooseFrom Auto Const
{ If set, contsrain possible legendary mod choices to this list... it's possible that depending on the list of items rolling and how limited the list of mods is, you might not get a legendary item }
FormList Property ListOfSpecificModsToDisallow Auto Const
{ If set, do not attach any of these particular legendary mods... it's possible that depending on the list of items rolling and how limited the list of mods is, you might not get a legendary item }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  LegendaryItemQuest.GenerateLegendaryItem(akTarget, LeveledListOfItemsToSpawn, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow)
EndEvent
