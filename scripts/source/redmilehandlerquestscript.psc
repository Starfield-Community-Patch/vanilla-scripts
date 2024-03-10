ScriptName RedMileHandlerQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerCompletedRedMile Auto Const mandatory
LocationAlias Property RedMile Auto Const mandatory
RefCollectionAlias Property Markers Auto Const mandatory
RefCollectionAlias Property Phase2Markers Auto Const mandatory
RefCollectionAlias Property Creatures Auto Const mandatory
ActorBase Property PCM_Porrima_Porrima_III_Predator01 Auto Const mandatory

;-- Functions ---------------------------------------

Function RespawnCreatures(Int aiPhase)
  Int I = 0
  Int iCount = 0
  If aiPhase <= 0
    iCount = Markers.GetCount()
    Self.Cleanup()
  Else
    iCount = Phase2Markers.GetCount()
  EndIf
  While I < iCount
    ObjectReference myMarker = None
    If aiPhase <= 0
      myMarker = Markers.GetAt(I)
    Else
      myMarker = Phase2Markers.GetAt(I)
    EndIf
    Int iRandom = Utility.RandomInt(1, 100)
    Int iSpawnMod = 0
    Float fNumTimesCompleted = PlayerCompletedRedMile.GetValue()
    If fNumTimesCompleted < 5.0
      If iRandom <= 25
        iSpawnMod = 0
      ElseIf iRandom > 25 && iRandom <= 65
        iSpawnMod = 1
      ElseIf iRandom > 55 && iRandom <= 75
        iSpawnMod = 2
      ElseIf iRandom > 75 && iRandom <= 80
        iSpawnMod = 3
      Else
        iSpawnMod = 4
      EndIf
    ElseIf fNumTimesCompleted >= 5.0 && fNumTimesCompleted < 12.0
      If iRandom <= 15
        iSpawnMod = 0
      ElseIf iRandom > 15 && iRandom <= 65
        iSpawnMod = 1
      ElseIf iRandom > 65 && iRandom <= 80
        iSpawnMod = 2
      ElseIf iRandom > 80 && iRandom <= 85
        iSpawnMod = 3
      Else
        iSpawnMod = 4
      EndIf
    ElseIf fNumTimesCompleted >= 12.0 && fNumTimesCompleted < 20.0
      If iRandom <= 10
        iSpawnMod = 0
      ElseIf iRandom > 10 && iRandom <= 40
        iSpawnMod = 1
      ElseIf iRandom > 40 && iRandom <= 80
        iSpawnMod = 2
      ElseIf iRandom > 80 && iRandom <= 90
        iSpawnMod = 3
      Else
        iSpawnMod = 4
      EndIf
    ElseIf fNumTimesCompleted >= 20.0 && fNumTimesCompleted < 25.0
      If iRandom <= 25
        iSpawnMod = 1
      ElseIf iRandom > 25 && iRandom <= 85
        iSpawnMod = 2
      ElseIf iRandom > 85 && iRandom <= 95
        iSpawnMod = 3
      Else
        iSpawnMod = 4
      EndIf
    ElseIf iRandom <= 80
      iSpawnMod = 2
    ElseIf iRandom > 80 && iRandom <= 95
      iSpawnMod = 3
    Else
      iSpawnMod = 4
    EndIf
    Location myLoc = RedMile.GetLocation()
    ObjectReference myCreature = myMarker.PlaceActorAtMe(PCM_Porrima_Porrima_III_Predator01, iSpawnMod, myLoc, False, False, True, None, True) as ObjectReference
    Creatures.AddRef(myCreature)
    I += 1
  EndWhile
EndFunction

Function Cleanup()
  Int I = 0
  Int iCount = Creatures.GetCount()
  While I < iCount
    ObjectReference myCreature = Creatures.GetAt(I)
    myCreature.Disable(False)
    myCreature.Delete()
    I += 1
  EndWhile
  Creatures.RemoveAll()
EndFunction
