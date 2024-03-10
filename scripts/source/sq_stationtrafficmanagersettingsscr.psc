ScriptName SQ_StationTrafficManagerSettingsScr Extends ObjectReference
{ Settings object for the Station Traffic Manager. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SystemProperties collapsedonref
  Int Property MinRefreshTime = 5 Auto Const
  { Default=5. Minimum time between traffic system spawning and undocking updates. }
  Int Property MaxRefreshTime = 15 Auto Const
  { Default=15. Maximum time between traffic system spawning and undocking updates. }
  Int Property MinSpawnDelay = 15 Auto Const
  { Default=15. Minimum delay between spawning new ships. }
  Float Property PercentEasy = 0.600000024 Auto Const
  { Default=0.5. Percent of traffic ships spawned at Easy difficulty. }
  Float Property PercentMedium = 0.300000012 Auto Const
  { Default=0.4. Percent of traffic ships spawned at Medium difficulty. }
  Float Property PercentHard = 0.100000001 Auto Const
  { Default=0.1. Percent of traffic ships spawned at Hard difficulty. }
  Float Property CombatTimestampElapsedDelay = 0.200000003 Auto Const
  { Default=0.20. If CombatTimestampGlobal is not None or set to 0, don't spawn ships if the current game time
     has advanced less than CombatTimestampElapsedDelay from the timestamp. }
EndGroup

Group StandardProperties
  FormList Property TrafficShiplist Auto Const
  { MANDATORY for refs. Formlist of ships to be used for traffic at this location. }
  Faction[] Property TrafficShipFactions Auto Const
  { OPTIONAL. Array of factions to apply to traffic ships at this location. Useful for adding station docking factions, etc. }
  Int Property MaxShips = 8 Auto Const
  { Default=8. Maximum number of traffic ships in this cell. }
  Int Property InitialShipsMin = 2 Auto Const
  { Default=2. Minimum number of initial ships to spawn. }
  Int Property InitialShipsMax = 4 Auto Const
  { Default=4. Maximum number of initial ships to spawn. }
  GlobalVariable Property CombatTimestampGlobal Auto Const
  { OPTIONAL. If set, the global variable to use as a timestamp when combat is started in this space cell. }
EndGroup

Group StationProperties
  Int Property MaxShipsInteractingWithStation = 3 Auto Const
  { Default=3. Maximum number of traffic ships that can be interacting with the station in any way.
    Includes fixed, docking, docked, and departing ships. }
  Int Property DockingDelayMin = 30 Auto Const
  { Default=30. Minimum delay between when a ship docks with the station and when it can undock. }
  Int Property DockingDelayMax = 45 Auto Const
  { Default=45. Maximum delay between when a ship docks with the station and when it can undock. }
  Int Property SafeSpawnDistanceFromStation = 750 Auto Const
  { Default=750. Minimum distance at which ships should spawn from the station. }
EndGroup

