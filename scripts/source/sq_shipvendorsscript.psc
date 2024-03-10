ScriptName SQ_ShipVendorsScript Extends Quest
{ script for SQ_ShipVendors quest which handles system for creating and managing ships for sale }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkShipVendorLandingMarker Auto Const mandatory
{ keyword to get landing marker a vendor is linked to }
GlobalVariable Property GameDaysPassed Auto Const mandatory
ActorValue Property SQ_ShipVendorsLastRefreshTimestamp Auto Const mandatory
{ used to stamp the vendor with the last player's visit - used to determine when to refresh ship list }
