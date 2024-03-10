ScriptName MissionBountySpaceScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group BountySpace
  RefCollectionAlias Property Escorts Auto Const
  { optional - holds escorts to randomly enable }
  RefCollectionAlias Property SpawnMarkers Auto Const
  { optional - holds spawn markers for escorts }
  ReferenceAlias Property SpaceMapMarker Auto Const mandatory
  Int Property ArriveInSystemStage = 20 Auto Const
  { stage that's set when the player arrives in target system }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted)
  If bAccepted
    spaceshipreference targetShip = PrimaryRef.GetShipRef()
    targetShip.Enable(False)
    SpaceMapMarker.TryToEnableNoWait()
    If Escorts as Bool && Escorts.GetCount() > 0
      Int numToEnable = Utility.RandomInt(1, Escorts.GetCount())
      If numToEnable > 0
        ObjectReference[] spawnMarkerArray = new ObjectReference[0]
        If SpawnMarkers
          spawnMarkerArray = SpawnMarkers.GetArray()
        EndIf
        Int I = 0
        While I < numToEnable
          spaceshipreference escortRef = Escorts.GetShipAt(I)
          If escortRef
            If spawnMarkerArray.Length > 0
              ObjectReference spawnMarkerRef = spawnMarkerArray[0]
              escortRef.MoveTo(spawnMarkerRef, 0.0, 0.0, 0.0, True, False)
              spawnMarkerArray.remove(0, 1)
            EndIf
            escortRef.Enable(False)
          EndIf
          I += 1
        EndWhile
      EndIf
    EndIf
  EndIf
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == ArriveInSystemStage
    ObjectReference mapMarkerRef = SpaceMapMarker.GetRef()
    mapMarkerRef.SetMarkerUndiscoveredVisibility(0)
  ElseIf auiStageID == CompleteStage
    ObjectReference mapmarkerref = SpaceMapMarker.GetRef()
    mapmarkerref.Disable(False)
  EndIf
EndEvent
