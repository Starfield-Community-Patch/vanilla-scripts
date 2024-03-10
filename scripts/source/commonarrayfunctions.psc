ScriptName CommonArrayFunctions Extends ScriptObject
{ Holds common functions for dealing with arrays of various types }

;-- Functions ---------------------------------------

Bool Function CheckObjectReferenceAgainstArray(ObjectReference ObjectToCheck, ObjectReference[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Int findVal = ArrayToCheck.find(ObjectToCheck, 0)
  Bool returnVal = False
  If findVal >= 0
    returnVal = True
  EndIf
  Return returnVal
EndFunction

Int Function FindInReferenceAliasArray(ObjectReference ObjectToCheck, ReferenceAlias[] ArrayToCheck) Global
  If ObjectToCheck == None
    Return -1
  ElseIf ArrayToCheck.Length == 0
    Return -1
  EndIf
  Int returnVal = -1
  If ObjectToCheck
    Int I = 0
    While returnVal == -1 && I < ArrayToCheck.Length
      If ArrayToCheck[I].GetReference() == ObjectToCheck
        returnVal = I
      EndIf
      I += 1
    EndWhile
  EndIf
  Return returnVal
EndFunction

Bool Function CheckObjectReferenceAgainstReferenceAliasArray(ObjectReference ObjectToCheck, ReferenceAlias[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Bool returnVal = CommonArrayFunctions.FindInReferenceAliasArray(ObjectToCheck, ArrayToCheck) > -1
  Return returnVal
EndFunction

Bool Function CheckActorAgainstFactionArray(Actor ObjectToCheck, Faction[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Bool returnVal = False
  If ObjectToCheck
    Int I = 0
    While returnVal == False && I < ArrayToCheck.Length
      returnVal = ObjectToCheck.IsInFaction(ArrayToCheck[I])
      I += 1
    EndWhile
  EndIf
  Return returnVal
EndFunction

Bool Function CheckObjectAgainstKeywordArray(ObjectReference ObjectToCheck, Keyword[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Bool returnVal = False
  If ObjectToCheck
    Int I = 0
    While returnVal == False && I < ArrayToCheck.Length
      returnVal = ObjectToCheck.HasKeyword(ArrayToCheck[I])
      I += 1
    EndWhile
  EndIf
  Return returnVal
EndFunction

Bool Function CheckFormAgainstKeywordArray(Form ObjectToCheck, Keyword[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If ObjectToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Bool returnVal = False
  If ObjectToCheck
    Int I = 0
    While returnVal == False && I < ArrayToCheck.Length
      returnVal = ObjectToCheck.HasKeyword(ArrayToCheck[I])
      I += 1
    EndWhile
  EndIf
  Return returnVal
EndFunction

Bool Function CheckFormAgainstArray(Form FormToCheck, Form[] ArrayToCheck, Bool returnValueIfArrayIsEmpty) Global
  If FormToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Int findVal = ArrayToCheck.find(FormToCheck, 0)
  Bool returnVal = False
  If findVal >= 0
    returnVal = True
  EndIf
  Return returnVal
EndFunction

Bool Function CheckLocationAgainstArray(Location ObjectToCheck, Location[] ArrayToCheck, Location LocationToCheckIsDifferent, Bool returnValueIfArrayIsEmpty, Bool matchIfChildLocation) Global
  If ObjectToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Int findVal = ArrayToCheck.find(ObjectToCheck, 0)
  Bool returnVal = False
  If findVal >= 0 && LocationToCheckIsDifferent != ArrayToCheck[findVal]
    returnVal = True
  ElseIf matchIfChildLocation
    Int I = 0
    While returnVal == False && I < ArrayToCheck.Length
      If ArrayToCheck[I].IsChild(ObjectToCheck) && (LocationToCheckIsDifferent == None || ArrayToCheck[I].IsChild(LocationToCheckIsDifferent) == False)
        returnVal = True
      EndIf
      I += 1
    EndWhile
  EndIf
  Return returnVal
EndFunction

Bool Function CheckLocationAgainstLocationAliasArray(Location ObjectToCheck, LocationAlias[] ArrayToCheck, Location LocationToCheckIsDifferent, Bool returnValueIfArrayIsEmpty, Bool matchIfChildLocation) Global
  If ObjectToCheck == None
    Return False
  ElseIf ArrayToCheck.Length == 0
    Return returnValueIfArrayIsEmpty
  EndIf
  Bool returnVal = False
  If ObjectToCheck
    Int I = 0
    While returnVal == False && I < ArrayToCheck.Length
      returnVal = ArrayToCheck[I].GetLocation() == ObjectToCheck && LocationToCheckIsDifferent != ArrayToCheck[I].GetLocation()
      If !returnVal && matchIfChildLocation
        returnVal = ArrayToCheck[I].GetLocation().IsChild(ObjectToCheck) && (LocationToCheckIsDifferent == None || ArrayToCheck[I].GetLocation().IsChild(LocationToCheckIsDifferent) == False)
        If returnVal
          
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
  Return returnVal
EndFunction

Keyword Function GetFirstFoundKeywordInArrayForLocation(Location LocationToCheck, Keyword[] ArrayToCheck) Global
  Keyword returnVal = None
  Int I = 0
  While I < ArrayToCheck.Length && returnVal == None
    If LocationToCheck.HasKeyword(ArrayToCheck[I])
      returnVal = ArrayToCheck[I]
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

Faction Function GetFirstFoundFactionInArrayForActor(Actor ActorToCheck, Faction[] ArrayToCheck) Global
  Faction returnVal = None
  Int I = 0
  While I < ArrayToCheck.Length && returnVal == None
    If ActorToCheck.IsInFaction(ArrayToCheck[I])
      returnVal = ArrayToCheck[I]
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

Bool Function IsActorInArrayHostileToActor(Actor ActorToCheck, ObjectReference[] ArrayToCheck) Global
  Bool returnVal = False
  Int I = 0
  While I < ArrayToCheck.Length && returnVal == False
    If (ArrayToCheck[I] as Actor).IsHostileToActor(ActorToCheck)
      returnVal = True
    EndIf
    I += 1
  EndWhile
  Return returnVal
EndFunction

Actor[] Function GetActorArrayFromAliasArray(ReferenceAlias[] AliasArrayToGetActorsFrom) Global
  Actor[] newArray = new Actor[0]
  Int I = 0
  While I < AliasArrayToGetActorsFrom.Length
    Actor actorRef = AliasArrayToGetActorsFrom[I].GetActorReference()
    If actorRef
      newArray.add(actorRef, 1)
    EndIf
    I += 1
  EndWhile
EndFunction

ObjectReference[] Function GetReferenceArrayFromAliasArray(ReferenceAlias[] AliasArrayToGetActorsFrom) Global
  ObjectReference[] newArray = new ObjectReference[0]
  Int I = 0
  While I < AliasArrayToGetActorsFrom.Length
    ObjectReference ref = AliasArrayToGetActorsFrom[I].GetActorReference() as ObjectReference
    If ref
      newArray.add(ref, 1)
    EndIf
    I += 1
  EndWhile
EndFunction

Int Function GetCountAliveStateFromArray(Actor[] ArrayToCheck, Bool CheckAlive) Global
  Int count = 0
  Int I = 0
  While I < ArrayToCheck.Length
    If ArrayToCheck[I].IsDead() != CheckAlive
      count += 1
    EndIf
    I += 1
  EndWhile
  Return count
EndFunction

Int Function GetCountLoadedStateFromArray(ObjectReference[] ArrayToCheck, Bool Check3DLoaded) Global
  Int count = 0
  Int I = 0
  While I < ArrayToCheck.Length
    If ArrayToCheck[I].Is3DLoaded() == Check3DLoaded
      count += 1
    EndIf
    I += 1
  EndWhile
  Return count
EndFunction

Int Function GetCountLoadedAndAliveStateFromArray(Actor[] ArrayToCheck, Bool Check3DLoaded, Bool CheckAlive) Global
  Int count = 0
  Int I = 0
  While I < ArrayToCheck.Length
    If ArrayToCheck[I].Is3DLoaded() == Check3DLoaded && ArrayToCheck[I].IsDead() != CheckAlive
      count += 1
    EndIf
    I += 1
  EndWhile
  Return count
EndFunction

Int Function GetCountAliveStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, Bool CheckAlive) Global
  Actor[] ArrayToCheck = CommonArrayFunctions.GetActorArrayFromAliasArray(AliasArrayToCheck)
  Return CommonArrayFunctions.GetCountAliveStateFromArray(ArrayToCheck, CheckAlive)
EndFunction

Int Function GetCountLoadedStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, Bool Check3DLoaded) Global
  ObjectReference[] ArrayToCheck = CommonArrayFunctions.GetReferenceArrayFromAliasArray(AliasArrayToCheck)
  Return CommonArrayFunctions.GetCountLoadedStateFromArray(ArrayToCheck, Check3DLoaded)
EndFunction

Int Function GetCountLoadedAndAliveStateFromAliasArray(ReferenceAlias[] AliasArrayToCheck, Bool Check3DLoaded, Bool CheckAlive) Global
  Actor[] ArrayToCheck = CommonArrayFunctions.GetActorArrayFromAliasArray(AliasArrayToCheck)
  Return CommonArrayFunctions.GetCountLoadedAndAliveStateFromArray(ArrayToCheck, Check3DLoaded, CheckAlive)
EndFunction

ReferenceAlias[] Function GetReferenceAliasesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) Global
  ReferenceAlias[] returnArray = new ReferenceAlias[0]
  Int I = 0
  While I < ArrayOfVariousTypesOfAliases.Length
    ReferenceAlias currentReferenceAlias = ArrayOfVariousTypesOfAliases[I] as ReferenceAlias
    If currentReferenceAlias
      returnArray.add(currentReferenceAlias, 1)
    EndIf
    I += 1
  EndWhile
  Return returnArray
EndFunction

RefCollectionAlias[] Function GetRefCollectionAliasesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) Global
  RefCollectionAlias[] returnArray = new RefCollectionAlias[0]
  Int I = 0
  While I < ArrayOfVariousTypesOfAliases.Length
    RefCollectionAlias currentRefCollectionAlias = ArrayOfVariousTypesOfAliases[I] as RefCollectionAlias
    If currentRefCollectionAlias
      returnArray.add(currentRefCollectionAlias, 1)
    EndIf
    I += 1
  EndWhile
  Return returnArray
EndFunction

ObjectReference[] Function GetReferencesFromAliasArray(Alias[] ArrayOfVariousTypesOfAliases) Global
  ObjectReference[] refs = new ObjectReference[0]
  Int I = 0
  While I < ArrayOfVariousTypesOfAliases.Length
    ReferenceAlias currentRefAllias = ArrayOfVariousTypesOfAliases[I] as ReferenceAlias
    RefCollectionAlias currentRefCollectionAlias = ArrayOfVariousTypesOfAliases[I] as RefCollectionAlias
    ObjectReference currentRef = None
    If currentRefAllias
      currentRef = currentRefAllias.GetRef()
      If currentRef
        refs.add(currentRef, 1)
      EndIf
    ElseIf currentRefCollectionAlias
      ObjectReference[] refColRefs = currentRefCollectionAlias.GetArray()
      Int r = 0
      While r < refColRefs.Length
        currentRef = refColRefs[r]
        If currentRef
          refs.add(currentRef, 1)
        EndIf
        r += 1
      EndWhile
    EndIf
    I += 1
  EndWhile
  Return refs
EndFunction

ObjectReference[] Function GetReferencesWithMatchingKeyword(ObjectReference[] ArrayOfRefsToCheck, Keyword KeywordToMatch) Global
  ObjectReference[] returnArray = new ObjectReference[0]
  Int I = 0
  While I < ArrayOfRefsToCheck.Length
    If ArrayOfRefsToCheck[I].HasKeyword(KeywordToMatch)
      returnArray.add(ArrayOfRefsToCheck[I], 1)
    EndIf
    I += 1
  EndWhile
  Return returnArray
EndFunction

Int Function GetRandomIndex(Int ArrayLength) Global
  Return Utility.RandomInt(0, ArrayLength - 1)
EndFunction

Int[] Function GetRandomizedIndexes(Int ArrayLength) Global
  Int[] randomizedIndexes = new Int[ArrayLength]
  Int I = 0
  While I < ArrayLength
    randomizedIndexes[I] = I
    I += 1
  EndWhile
  I = ArrayLength - 1
  While I > 0
    Int r = Utility.RandomInt(0, I)
    Int temp = randomizedIndexes[I]
    randomizedIndexes[I] = randomizedIndexes[r]
    randomizedIndexes[r] = temp
    I -= 1
  EndWhile
  Return randomizedIndexes
EndFunction

ObjectReference[] Function CopyObjArray(ObjectReference[] input) Global
  ObjectReference[] output = new ObjectReference[input.Length]
  Int I = 0
  While I < input.Length
    output[I] = input[I]
    I += 1
  EndWhile
  Return output
EndFunction

ObjectReference[] Function CopyAndRandomizeObjArray(ObjectReference[] input) Global
  ObjectReference[] output = CommonArrayFunctions.CopyObjArray(input)
  Float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0.0, 1.0)
  Int I = output.Length - 1
  While I >= 0
    Int currentRandomIndex = (random[I] * I as Float) as Int
    ObjectReference temp = output[I]
    output[I] = output[currentRandomIndex]
    output[currentRandomIndex] = temp
    I -= 1
  EndWhile
  Return output
EndFunction

Actor[] Function CopyActorArray(Actor[] input) Global
  Actor[] output = new Actor[input.Length]
  Int I = 0
  While I < input.Length
    output[I] = input[I]
    I += 1
  EndWhile
  Return output
EndFunction

Actor[] Function CopyAndRandomizeActorArray(Actor[] input) Global
  Actor[] output = CommonArrayFunctions.CopyActorArray(input)
  Float[] random = Utility.RandomFloatsFromSeed(Utility.RandomInt(0, 100000), output.Length, 0.0, 1.0)
  Int I = output.Length - 1
  While I >= 0
    Int currentRandomIndex = (random[I] * I as Float) as Int
    Actor temp = output[I]
    output[I] = output[currentRandomIndex]
    output[currentRandomIndex] = temp
    I -= 1
  EndWhile
  Return output
EndFunction

ObjectReference[] Function GetAllRefsInTriggers(ObjectReference[] triggers) Global
  ObjectReference[] returnVal = new ObjectReference[0]
  Int I = 0
  While I < triggers.Length
    ObjectReference[] allRefsInCurrentTrigger = triggers[I].GetAllRefsInTrigger()
    Int j = 0
    While j < allRefsInCurrentTrigger.Length
      If returnVal.find(allRefsInCurrentTrigger[j], 0) < 0
        returnVal.add(allRefsInCurrentTrigger[j], 1)
      EndIf
      j += 1
    EndWhile
    I += 1
  EndWhile
  Return returnVal
EndFunction

ObjectReference[] Function SortRefsByValue(ObjectReference[] input, ActorValue sortAV) Global
  ObjectReference[] sortedInput = new ObjectReference[0]
  Int I = 0
  While I < input.Length
    ObjectReference current = input[I]
    If current != None
      Float currentValue = current.GetValue(sortAV)
      Int j = 0
      While j < sortedInput.Length
        If sortedInput[j].GetValue(sortAV) >= currentValue
          sortedInput.insert(current, j)
          j = sortedInput.Length + 1
        EndIf
        j += 1
      EndWhile
      If j == sortedInput.Length
        sortedInput.add(current, 1)
      EndIf
    EndIf
    I += 1
  EndWhile
  Return sortedInput
EndFunction
