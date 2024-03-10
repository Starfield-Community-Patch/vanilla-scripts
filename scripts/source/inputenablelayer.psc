ScriptName InputEnableLayer Extends ScriptObject Native hidden
{ This is a single layer of input enable/disable. The end result of all layers in the game
determine the actual state of the player's controls. }

;-- Functions ---------------------------------------

InputEnableLayer Function Create() Global Native

Function Delete() Native

Function DisablePlayerControls(Bool abMovement, Bool abFighting, Bool abCamSwitch, Bool abLooking, Bool abSneaking, Bool abMenu, Bool abActivate, Bool abJournalTabs, Bool abVATS, Bool abFavorites, Bool abRunning) Native

Function EnableActivate(Bool abEnable) Native

Function EnableCamSwitch(Bool abEnable) Native

Function EnableFarTravel(Bool abEnable) Native

Function EnableFastTravel(Bool abEnable) Native

Function EnableFavorites(Bool abEnable) Native

Function EnableFighting(Bool abEnable) Native

Function EnableGravJump(Bool abEnable) Native

Function EnableHandscanner(Bool abEnable) Native

Function EnableInventoryMenuAccess(Bool aEnable) Native

Function EnableJournal(Bool abEnable) Native

Function EnableJumping(Bool abEnable) Native

Function EnableLocationDiscovery(Bool abEnable) Native

Function EnableLooking(Bool abEnable) Native

Function EnableMenu(Bool abEnable) Native

Function EnableMovement(Bool abEnable) Native

Function EnablePlayerControls(Bool abMovement, Bool abFighting, Bool abCamSwitch, Bool abLooking, Bool abSneaking, Bool abMenu, Bool abActivate, Bool abJournalTabs, Bool abVATS, Bool abFavorites, Bool abRunning) Native

Function EnableRunning(Bool abEnable) Native

Function EnableSneaking(Bool abEnable) Native

Function EnableSprinting(Bool abEnable) Native

Function EnableTakeoff(Bool abEnable) Native

Function EnableVATS(Bool abEnable) Native

Function EnableZKey(Bool abEnable) Native

Bool Function IsActivateEnabled() Native

Bool Function IsCamSwitchEnabled() Native

Bool Function IsFarTravelEnabled() Native

Bool Function IsFastTravelEnabled() Native

Bool Function IsFavoritesEnabled() Native

Bool Function IsFightingEnabled() Native

Bool Function IsGravJumpEnabled() Native

Bool Function IsHandscannerEnabled() Native

Bool Function IsInventoryMenuAccessEnabled() Native

Bool Function IsJournalEnabled() Native

Bool Function IsJumpingEnabled() Native

Bool Function IsLocationDiscoveryEnabled() Native

Bool Function IsLookingEnabled() Native

Bool Function IsMenuEnabled() Native

Bool Function IsMovementEnabled() Native

Bool Function IsRunningEnabled() Native

Bool Function IsSneakingEnabled() Native

Bool Function IsSprintingEnabled() Native

Bool Function IsTakeoffEnabled() Native

Bool Function IsVATSEnabled() Native

Bool Function IsZKeyEnabled() Native

Function Reset() Native
