ScriptName SE_RandomLootSpawnerScript Extends Quest
{ Spawns a random number of a particular item based off of a formlist }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Markers Auto Const mandatory
{ Refcollection of the markers that this script can place items at }
RefCollectionAlias Property Alias_SpawnedObjects Auto Const mandatory
{ Refcollection that the containers will go into }
FormList Property Crateslist Auto Const mandatory
{ Formlist of different types of items that can be spawned }
Int Property maxLoot Auto Const mandatory
{ maximum number of items that can be spawned }
Int Property hazardChance Auto Const mandatory
{ percent chance (1-100) that a hazard will appear at the same point as the loot }
Form Property PI_SpaceHazard Auto Const
{ Packin containing the hazard and effect }
Bool Property itemsAreRandom Auto Const mandatory
{ Do you want to spawn all of the same item or not }

;-- Functions ---------------------------------------

Event OnQuestinit()
  Int crateType = Utility.RandomInt(0, Crateslist.GetSize() - 1)
  Int numCrates = Utility.RandomInt(1, maxLoot)
  Int I = 0
  While I < numCrates
    ObjectReference Spawnpoint = Alias_Markers.GetAt(Utility.RandomInt(0, Alias_Markers.GetCount() - 1))
    ObjectReference newCrate = None
    If itemsAreRandom == False
      newCrate = Spawnpoint.PlaceAtMe(Crateslist.GetAt(crateType), 1, False, False, True, None, None, True)
    Else
      newCrate = Spawnpoint.PlaceAtMe(Crateslist.GetAt(Utility.RandomInt(0, Crateslist.GetSize() - 1)), 1, False, False, True, None, None, True)
    EndIf
    If Utility.RandomInt(0, 99) < hazardChance
      Spawnpoint.PlaceAtMe(PI_SpaceHazard, 1, False, False, True, None, None, True)
    EndIf
    Alias_Markers.RemoveRef(Spawnpoint)
    Alias_SpawnedObjects.addRef(newCrate)
    If Alias_Markers.GetCount() == 0
      I = numCrates
    EndIf
    I += 1
  EndWhile
EndEvent
