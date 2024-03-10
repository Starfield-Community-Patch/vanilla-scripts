ScriptName SE_SpecificLootSpawner Extends Quest
{ Spawns a specific object at a number of generic markers. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Markers Auto Const mandatory
{ Possible locations at which loot items can be placed. }
Form Property LootItem Auto Const mandatory
{ The specific loot item type that will be placed. }
Int Property AmountOfLoot Auto Const mandatory
{ The maximum number of loot items that will be placed, if less than number of references in Alias_Markers. }

;-- Functions ---------------------------------------

Event OnQuestinit()
  Int I = AmountOfLoot
  If I > Alias_Markers.GetCount()
    I = Alias_Markers.GetCount()
  EndIf
  While I >= 0
    ObjectReference Spawnpoint = Alias_Markers.GetAt(Utility.RandomInt(0, Alias_Markers.GetCount() - 1))
    ObjectReference NewObject = Spawnpoint.PlaceAtMe(LootItem, 1, False, False, True, None, None, True)
    Alias_Markers.RemoveRef(Alias_Markers.GetAt(I))
    I -= 1
  EndWhile
EndEvent
