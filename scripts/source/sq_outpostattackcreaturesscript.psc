ScriptName SQ_OutpostAttackCreaturesScript Extends SQ_OutpostAttackScript

;-- Structs -----------------------------------------
Struct AttackCreatureData
  RefCollectionAlias collectionAlias
  Int minSpawnCount = 0
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AttackCreaturesGroup
  sq_outpostattackcreaturesscript:attackcreaturedata[] Property Creatures Auto Const mandatory
  { array of spawned creatures of various types (Biome_PredatorSolitary, Biome_PredatorHerdSmall, etc.)
        Not all of the ref collections will necessarily have anything in them, depending on the types of creatures that exist on this planet }
EndGroup


;-- Functions ---------------------------------------

Function HandleQuestStarted()
  Int[] randomArray = new Int[Creatures.Length]
  Int I = 0
  While I < randomArray.Length
    randomArray[I] = I
    I += 1
  EndWhile
  Bool found = False
  While randomArray.Length > 0 && found == False
    Int randomArrayIndex = Utility.RandomInt(0, randomArray.Length - 1)
    Int creaturesIndex = randomArray[randomArrayIndex]
    sq_outpostattackcreaturesscript:attackcreaturedata theCreatureData = Creatures[creaturesIndex]
    If theCreatureData.collectionAlias.GetCount() > 0
      found = True
      Int spawnCount = Utility.RandomInt(theCreatureData.minSpawnCount, theCreatureData.collectionAlias.GetCount())
      While theCreatureData.collectionAlias.GetCount() > spawnCount && theCreatureData.collectionAlias.GetCount() > 0
        theCreatureData.collectionAlias.RemoveRef(theCreatureData.collectionAlias.GetAt(0))
      EndWhile
      Attackers.AddRefCollection(theCreatureData.collectionAlias)
    Else
      randomArray.remove(randomArrayIndex, 1)
    EndIf
  EndWhile
  If found
    Attackers.EnableAll(False)
  Else
    Self.Stop()
  EndIf
EndFunction
