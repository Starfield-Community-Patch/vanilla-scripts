ScriptName MissionBoardActivatorScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property MissionBoardFilterKeyword Auto Const
{ optional - keyword to pass in to filter mission quests }
conditionform Property AccessConditions Auto Const
{ optional - if included, this condition must be true to open the menu }
Message Property AccessFailureMessage Auto Const
{ optional - if included, message will be displayed if the AccessConditions are false }
missionparentscript Property MB_Parent Auto Const mandatory
{ mission parent quest }
Location Property OverrideLocation Auto Const
{ optional - if provided, the missions will populate using this location rather than the mission board's location }
Int Property FactionID = -1 Auto Const
{ optional - pass in one of the following factionIDs if you want a "themed" mission board UI:
    United Colonies = 1
    Ryujin Industries = 2
    House Varuun = 3
    Freestar = 4
    Crimson Fleet = 5
    Constellation = 6 }
Bool Property NeverResetOnLoad = False Auto Const
{ used by "local" activators since we don't want to reset missions on load when the player may not be in the location }
Bool Property AlwaysResetOnLoad = False Auto Const
{ if true, will reset with override onLoad. Use carefully, normally we don't want this behavior }

;-- Functions ---------------------------------------

Event OnLoad()
  If NeverResetOnLoad == False
    Self.ResetMissions()
  EndIf
EndEvent

Function ResetMissions()
  Location myResetLocation = None
  If OverrideLocation
    myResetLocation = OverrideLocation
  Else
    If Self.GetWorkshop()
      myResetLocation = Self.GetCurrentLocation()
    Else
      Location[] settlementLocations = Self.GetCurrentLocation().GetParentLocations(MB_Parent.LocTypeSettlement)
      If settlementLocations.Length > 0
        myResetLocation = settlementLocations[0]
      EndIf
    EndIf
    If myResetLocation == None
      myResetLocation = Self.GetCurrentLocation()
    EndIf
  EndIf
  If myResetLocation
    MB_Parent.ResetMissions(False, False, myResetLocation, AlwaysResetOnLoad)
  EndIf
EndFunction

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  Self.ResetMissions()
EndEvent

;-- State -------------------------------------------
State busy

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State default

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.GotoState("busy")
      If AccessConditions == None || AccessConditions.IsTrue(Game.GetPlayer() as ObjectReference, Self as ObjectReference)
        MB_Parent.UpdateMissions()
        Game.ShowMissionBoardMenu(MissionBoardFilterKeyword, FactionID)
      ElseIf AccessFailureMessage
        AccessFailureMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
      Self.GotoState("default")
    EndIf
  EndEvent
EndState
