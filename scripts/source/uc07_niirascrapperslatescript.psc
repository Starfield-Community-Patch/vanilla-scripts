ScriptName UC07_NiiraScrapperSlateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference[] Property MarkersToAdd Auto Const mandatory
{ Give the player all the map markers in and around 1-Of-A-Kind }
GlobalVariable Property UC07_PlayerKnowsAllMechyardMarkers Auto Const mandatory
{ Global used to shut down this loop so we're not processing it after the player
has all the markers }

;-- Functions ---------------------------------------

Event OnRead()
  If UC07_PlayerKnowsAllMechyardMarkers.GetValue() < 1.0
    Int I = 0
    Int iLength = MarkersToAdd.Length
    While I < iLength
      ObjectReference currMarker = MarkersToAdd[I]
      If !currMarker.IsMapMarkerVisible()
        currMarker.AddToMapScanned(False)
      EndIf
      I += 1
    EndWhile
    UC07_PlayerKnowsAllMechyardMarkers.SetValue(1.0)
  EndIf
EndEvent
