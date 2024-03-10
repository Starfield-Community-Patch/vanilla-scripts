ScriptName Patch_Update03_FixFollowerScript Extends Quest

;-- Structs -----------------------------------------
Struct QuestFollowerFixDatum
  defaultfollowertogglequestscript FollowerToggleQuest
  ReferenceAlias AliasToFix
  Location DisallowedLocation
  ObjectReference FixByMovingToReference
  { Use marker if possible. If not a marker, this will make this reference persist. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property CheckForLocationChanges = True Auto Const
{ making a property we can turn off if we implement a fix to prevent this from happening in another update }
patch_update03_fixfollowerscript:questfollowerfixdatum[] Property QuestFollowerFixData Auto Const mandatory
Faction Property CurrentFollowerFaction Auto Const mandatory
{ autocomplete }

;-- Functions ---------------------------------------

Event OnQuestInit()
  If CheckForLocationChanges
    Self.RegisterForLocationChanges()
  EndIf
  Self.FixQuestFollowers(None)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Self.FixQuestFollowers(akSender)
EndEvent

Function RegisterForLocationChanges()
  Int I = 0
  While I < QuestFollowerFixData.Length
    Self.RegisterForRemoteEvent(QuestFollowerFixData[I].AliasToFix as ScriptObject, "OnLocationChange")
    I += 1
  EndWhile
EndFunction

Function FixQuestFollowers(ReferenceAlias SpecificRefAliasToCheck)
  Int I = 0
  While I < QuestFollowerFixData.Length
    patch_update03_fixfollowerscript:questfollowerfixdatum currentDatum = QuestFollowerFixData[I]
    If (SpecificRefAliasToCheck as Bool == False) || SpecificRefAliasToCheck == currentDatum.AliasToFix
      Self.FixQuestFollower(currentDatum)
    EndIf
    I += 1
  EndWhile
EndFunction

Function FixQuestFollower(patch_update03_fixfollowerscript:questfollowerfixdatum DatumToFix)
  Actor actorToFix = DatumToFix.AliasToFix.GetActorReference()
  Location DisallowedLocation = DatumToFix.DisallowedLocation
  ObjectReference FixByMovingToReference = DatumToFix.FixByMovingToReference
  Location currentLocation = None
  If actorToFix
    currentLocation = actorToFix.GetCurrentLocation()
  EndIf
  If actorToFix as Bool && currentLocation == DisallowedLocation
    defaultfollowertogglequestscript FollowerToggleQuest = DatumToFix.FollowerToggleQuest
    actorToFix.MoveTo(FixByMovingToReference, 0.0, 0.0, 0.0, True, False)
    If CheckForLocationChanges == False
      Self.UnregisterForRemoteEvent(DatumToFix.AliasToFix as ScriptObject, "OnLocationChange")
    EndIf
  EndIf
EndFunction
