ScriptName SQ_TrafficManagerSettingsScript Extends ObjectReference
{ Settings for Traffic Manager }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TrafficManagerQuest Auto Const mandatory
{ Quest that handles this system }
Float Property MinRefreshTime Auto Const mandatory
Float Property MaxRefreshTime Auto Const mandatory
{ how often the system checks to see if ships need to be spawned or despawned }
FormList Property TrafficShiplist Auto Const mandatory
{ List of Ships that will appear at this location }
Int Property MaxShips Auto Const
{ Maximum number of ships that can be in this cell }
