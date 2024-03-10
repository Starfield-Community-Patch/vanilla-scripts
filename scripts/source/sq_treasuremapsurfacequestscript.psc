ScriptName SQ_TreasureMapSurfaceQuestScript Extends SQ_TreasureMapQuestScript

;-- Variables ---------------------------------------
Location myDungeonLocation
resource myResource

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard itemTrackingGuard

;-- Properties --------------------------------------
ReferenceAlias Property TreasureContainer Auto Const mandatory
{ Treasure container }
LocationAlias Property dungeonLocation Auto Const mandatory
{ treasure location }
missionparentscript Property MB_Parent Auto Const mandatory
{ holds array of resource AVs }

;-- Functions ---------------------------------------

Bool Function CreateTreasure()
  Bool success = False
  ObjectReference treasureRef = Treasure.GetRef()
  sq_treasuremapscript treasureMapRef = TreasureMapOriginal.GetRef() as sq_treasuremapscript
  If treasureRef as Bool && treasureMapRef as Bool
    success = True
    If treasureMapRef.TreasureMod
      treasureRef.AttachMod(treasureMapRef.TreasureMod, 0)
    EndIf
    treasureRef.PromoteToLegendary(0, None)
    TreasureContainer.GetRef().AddItem(treasureRef as Form, 1, False)
    If treasureMapRef.TreasureQuantityMax > 1
      Int amountToAdd = Utility.RandomInt(treasureMapRef.TreasureQuantityMin, treasureMapRef.TreasureQuantityMax) - 1
      If amountToAdd > 0
        If treasureMapRef.TreasureAllTheSameThing
          Form baseTreasure = treasureRef.GetBaseObject()
          TreasureContainer.GetRef().AddItem(baseTreasure, amountToAdd, False)
        Else
          TreasureContainer.GetRef().AddItem(treasureMapRef.Treasure, amountToAdd, False)
        EndIf
      EndIf
    EndIf
    If treasureMapRef.TreasureLocation == 1
      MiscObject treasureMiscObject = treasureRef.GetBaseObject() as MiscObject
      If treasureMiscObject
        missionparentscript:missionsupplytype[] resourceAVs = MB_Parent.resourceAVs
        ActorValue resourceAV = None
        Int I = 0
        While I < resourceAVs.Length && resourceAV == None
          ActorValue testResourceAV = resourceAVs[I].supplyAV
          myResource = testResourceAV.GetResource()
          If myResource as Bool && treasureMiscObject.GetObjectResourceCount(myResource) as Bool
            resourceAV = testResourceAV
          EndIf
          I += 1
        EndWhile
        If resourceAV
          myDungeonLocation = dungeonLocation.GetLocation()
          If myDungeonLocation
            myDungeonLocation.SetValue(resourceAV, 1.0)
          EndIf
        EndIf
        Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
      EndIf
    EndIf
  EndIf
  Return success
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  If myDungeonLocation
    If akNewLoc == myDungeonLocation || akOldLoc == myDungeonLocation
      Self.UpdateItemTracking()
    EndIf
  EndIf
EndEvent

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If aiTransferReason == 4 || aiTransferReason == 7 || aiTransferReason == 12 || aiTransferReason == 42
    Self.SetStage(ObjectiveStage)
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded")
  EndIf
EndEvent

Function UpdateItemTracking()
  Guard itemTrackingGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor playerRef = Game.GetPlayer()
    If playerRef.GetCurrentLocation() == myDungeonLocation
      Self.AddInventoryEventFilter(myResource as Form)
      Self.RegisterForRemoteEvent(playerRef as ScriptObject, "OnItemAdded")
    Else
      Self.UnregisterForRemoteEvent(playerRef as ScriptObject, "OnItemAdded")
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
