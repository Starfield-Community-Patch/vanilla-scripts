ScriptName SEScript Extends rescript

;-- Variables ---------------------------------------
Int FallbackHailTimerID = 2
Int GlobalHailTimerID = 1

;-- Properties --------------------------------------
Group SE_Properties
  ReferenceAlias Property PlayerShip Auto Const mandatory
  { player ship alias }
  LocationAlias Property OrbitLocation Auto Const mandatory
  { orbit location for this SE }
  Bool Property StopQuestWhenPlayerLeavesSystem = True Auto
  { Default = true, once player leaves system, quest should stop }
  LocationAlias Property LocationShutdownOnExit Auto Const
  { OPTIONAL: shutdown this quest when player ship exits this location }
  Bool Property SetStageOnInSameLocation = False Auto Const
  { Set a stage when the player is in the same location as this SE }
  Bool Property UseGlobalHailTimer = False Auto Const
  { If you want this script to handle triggering the hail for this SE }
  GlobalVariable Property SEGlobalHailTimer Auto Const mandatory
  { Global variable for the initial hail }
  Int Property HailTimerModifier = 0 Auto Const
  { Increases or decreases the default SeGlobalHailTimer by HailTimerModifier seconds }
  Int Property HailingStage = 50 Auto Const
  { Stage that starts the hail }
  Int Property HailingDoneStage = 100 Auto Const
  { Stage that tracks if the hailing scene has already been run }
  Int Property stageToSetOnInSameLocation Auto Const
  { stage to set when the ship is in this location }
  ReferenceAlias Property HailingShip Auto Const
  { hailing ship alias }
  Bool Property enableMapMarkerOnStart Auto Const
  { enable mapmarker for POI SEs so the banner doesn't show on arrival for player SEs }
  Int Property FallBackTimerAdded = 5 Auto Const
  { Additional buffer time for backup timer for the automatic hail. }
  Bool Property setCooldownOnShutdown = False Auto Const
  { if true, will set cooldown timer on quest stoppage. For Player encounters where change location cooldown is invalid }
EndGroup


;-- Functions ---------------------------------------

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  ; Empty function
EndEvent

Event OnQuestStarted()
  If (LocationShutdownOnExit as Bool || StopQuestWhenPlayerLeavesSystem) || UseGlobalHailTimer
    Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
    Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipGravJump")
  EndIf
  bFinishedOnStoryEvent = True
  If enableMapMarkerOnStart
    MapMarker.GetRef().Enable(False)
  EndIf
  If Self.CheckLocation() && UseGlobalHailTimer
    Self.RegisterForMenuOpenCloseEvent("FaderMenu")
    Self.StartFallbackHailTimer()
  EndIf
  Parent.OnQuestStarted()
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Bool shouldShutdown = False
  If setCooldownOnLoad
    Location orbitLoc = OrbitLocation.GetLocation()
    If akNewLoc == orbitLoc || orbitLoc.IsChild(akNewLoc)
      Self.SetCooldown()
    EndIf
  EndIf
  If SetStageOnInSameLocation
    Location orbitloc = OrbitLocation.GetLocation()
    If akNewLoc == orbitloc || orbitloc.IsChild(akNewLoc)
      Self.SetStage(stageToSetOnInSameLocation)
    EndIf
  EndIf
  If LocationShutdownOnExit
    Location shutdownLocation = LocationShutdownOnExit.GetLocation()
    If shutdownLocation
      If akNewLoc == None || akNewLoc != shutdownLocation || shutdownLocation.IsChild(akNewLoc) == False
        shouldShutdown = True
      EndIf
    EndIf
  EndIf
  If shouldShutdown == False && StopQuestWhenPlayerLeavesSystem
    Location myOrbitLocation = OrbitLocation.GetLocation()
    If (myOrbitLocation as Bool && akNewLoc as Bool) && myOrbitLocation.HasCommonParent(akNewLoc, RE_Parent.LocTypeStarSystem) == False
      shouldShutdown = True
    EndIf
  EndIf
  If shouldShutdown
    Self.Shutdown()
  EndIf
  If Self.CheckLocation() && UseGlobalHailTimer
    Self.RegisterForMenuOpenCloseEvent("FaderMenu")
    Self.StartFallbackHailTimer()
  EndIf
EndEvent

Event ReferenceAlias.OnShipGravJump(ReferenceAlias akSender, Location aDestination, Int aState)
  If aState == 1
    If StopQuestWhenPlayerLeavesSystem
      Self.Shutdown()
    EndIf
  EndIf
EndEvent

Event OnQuestShutdown()
  If setCooldownOnShutdown == True
    Self.SetCooldown()
  EndIf
EndEvent

Bool Function RemoveItemFromPlayerOrShip(Form itemToRemove, Int countToRemove, Int stageToSetOnSuccess, Bool preferShipInventory)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  ObjectReference playerRef = Game.GetPlayer() as ObjectReference
  Bool success = False
  If preferShipInventory
    success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerShipRef as ObjectReference)
  Else
    success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerRef)
  EndIf
  If success == False
    If preferShipInventory
      success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerRef)
    Else
      success = Self.TryToRemoveItem(itemToRemove, countToRemove, playerShipRef as ObjectReference)
    EndIf
  EndIf
  If success && stageToSetOnSuccess > -1
    Self.SetStage(stageToSetOnSuccess)
  EndIf
  Return success
EndFunction

Bool Function TryToRemoveItem(Form itemToRemove, Int countToRemove, ObjectReference refToRemoveFrom)
  Bool success = False
  If refToRemoveFrom as Bool && refToRemoveFrom.GetItemCount(itemToRemove) >= countToRemove
    success = True
    refToRemoveFrom.RemoveItem(itemToRemove, countToRemove, False, None)
  EndIf
  Return success
EndFunction

Bool Function CheckLocation()
  Location orbitLoc = OrbitLocation.GetLocation()
  If PlayerShip.GetRef().IsinLocation(orbitLoc)
    Return True
  Else
    Return False
  EndIf
EndFunction

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "FaderMenu"
    If !abOpening
      Self.StartGlobalHailTimer()
      Self.UnRegisterForMenuOpenCloseEvent("FaderMenu")
    EndIf
  EndIf
EndEvent

Function StartGlobalHailTimer()
  Self.StartTimer(SEGlobalHailTimer.GetValue() + HailTimerModifier as Float, GlobalHailTimerID)
EndFunction

Function StartFallbackHailTimer()
  Self.StartTimer((SEGlobalHailTimer.GetValue() + HailTimerModifier as Float) + FallBackTimerAdded as Float, FallbackHailTimerID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == GlobalHailTimerID || aiTimerID == FallbackHailTimerID
    If Self.GetStageDone(HailingDoneStage) == False && Self.CheckLocation()
      Self.SetStage(HailingStage)
      Self.UnRegisterForMenuOpenCloseEvent("FaderMenu")
    EndIf
  EndIf
EndEvent

Function DebugPOI()
{ Debug function to cqf for testing. }
  ObjectReference testmapmarker = MapMarker.GetRef()
  ObjectReference XMarker = MapMarker.GetRef().GetLinkedRef(None)
  Game.GetPlayer().moveto(XMarker, 0.0, 0.0, 0.0, True, False)
EndFunction
