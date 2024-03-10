ScriptName SQ_TreasureMapSpaceQuestScript Extends SQ_TreasureMapQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property GeneralMarkers Auto Const mandatory
{ Possible locations at which loot items can be placed. }
RefCollectionAlias Property TreasureContainers Auto Const mandatory
{ put created containers here }
Container Property SQ_TreasureMap_SpaceCrate Auto Const mandatory
{ standard "space crate" }

;-- Functions ---------------------------------------

Bool Function CreateTreasure()
  Bool success = False
  ObjectReference treasureRef = Treasure.GetRef()
  sq_treasuremapspacescript treasureMapRef = TreasureMapOriginal.GetRef() as sq_treasuremapspacescript
  If treasureRef as Bool && treasureMapRef as Bool
    Int I = Utility.RandomInt(treasureMapRef.TreasureContainersMin, treasureMapRef.TreasureContainersMax)
    Int markerCount = GeneralMarkers.GetCount()
    If I > markerCount
      I = markerCount
    EndIf
    Form treasureItem = None
    If treasureMapRef.TreasureAllTheSameThing
      treasureItem = treasureRef.GetBaseObject()
    Else
      treasureItem = treasureMapRef.Treasure
    EndIf
    While I > 0
      ObjectReference spawnMarker = GeneralMarkers.GetAt(Utility.RandomInt(0, GeneralMarkers.GetCount() - 1))
      ObjectReference newContainer = spawnMarker.PlaceAtMe(SQ_TreasureMap_SpaceCrate as Form, 1, False, False, True, None, None, True)
      GeneralMarkers.RemoveRef(GeneralMarkers.GetAt(I))
      TreasureContainers.AddRef(newContainer)
      Int amountToAdd = Utility.RandomInt(treasureMapRef.TreasureQuantityMin, treasureMapRef.TreasureQuantityMax)
      If amountToAdd > 0
        newContainer.AddItem(treasureItem, amountToAdd, False)
        success = True
      EndIf
      I -= 1
    EndWhile
  EndIf
  Return success
EndFunction
