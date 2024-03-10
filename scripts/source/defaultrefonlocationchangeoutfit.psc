ScriptName DefaultRefOnLocationChangeOutfit Extends Actor Const default
{ change outfits on location change }

;-- Structs -----------------------------------------
Struct OutfitChange
  Location NewLocation
  { change outfit when moving TO this location }
  Location OldLocation
  { change outfit when moving FROM this location }
  Outfit ChangeToOutfit
  { outfit to change into }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultrefonlocationchangeoutfit:outfitchange[] Property OutfitChangeList Auto Const
{ list of location/outfit combinations }

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Int I = 0
  While I < OutfitChangeList.Length
    defaultrefonlocationchangeoutfit:outfitchange theOutfitChange = OutfitChangeList[I]
    If theOutfitChange.NewLocation == akNewLoc
      Self.SetOutfit(theOutfitChange.ChangeToOutfit, False)
    ElseIf theOutfitChange.OldLocation == akOldLoc
      Self.SetOutfit(theOutfitChange.ChangeToOutfit, False)
    EndIf
    I += 1
  EndWhile
EndEvent
