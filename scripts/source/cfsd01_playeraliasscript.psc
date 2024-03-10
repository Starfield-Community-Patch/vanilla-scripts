ScriptName CFSD01_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CFSD01 Auto Const mandatory
Location Property LC082VigilanceLocation Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc == LC082VigilanceLocation
    (CFSD01 as cfsd01_questscript).JailCheck()
  EndIf
EndEvent
