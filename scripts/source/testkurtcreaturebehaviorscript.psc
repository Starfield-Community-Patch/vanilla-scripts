ScriptName TestKurtCreatureBehaviorScript Extends Quest
{ used to create creatures for testing CCT behaviors }

;-- Structs -----------------------------------------
Struct CreatureData
  RefCollectionAlias collectionAlias
  ActorBase creature
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
testkurtcreaturebehaviorscript:creaturedata[] Property CreatureArray Auto Const
{ index should match message box index }
RefCollectionAlias Property Creatures Auto Const mandatory
{ holds all created creatures }
ReferenceAlias Property SpawnMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  ; Empty function
EndEvent

Function CreateCreature(Int creatureIndex)
  testkurtcreaturebehaviorscript:creaturedata theData = CreatureArray[creatureIndex]
  If theData
    Actor theCreature = SpawnMarker.GetRef().PlaceActorAtMe(theData.creature, 4, None, False, False, True, None, True)
    theData.collectionAlias.AddRef(theCreature as ObjectReference)
    Creatures.AddRef(theCreature as ObjectReference)
  EndIf
EndFunction

Function ResetCreatures()
  Int I = 0
  While I < CreatureArray.Length
    CreatureArray[I].collectionAlias.RemoveAll()
    I += 1
  EndWhile
  Creatures.DisableAll(False)
  Creatures.RemoveAll()
EndFunction
