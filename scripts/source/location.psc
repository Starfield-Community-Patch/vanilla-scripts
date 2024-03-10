ScriptName Location Extends Form Native hidden

;-- Functions ---------------------------------------

Function AddKeyword(Keyword akKeyword) Native

Function AddLinkedLocation(Location akLoc, Keyword akKeyword) Native

Int Function CountActors(Keyword apRequiredLinkedRefKeyword, Keyword apExcludeLinkedRefKeyword) Native

Bool Function DisableSpaceTravelToAllExcept(Quest akQuest, Bool abAddLocation) Native

Bool Function EnableSpaceTravel(Quest akQuest, Bool abEnable) Native

Actor[] Function GetActors(Keyword apRequiredLinkedRefKeyword, Keyword apExcludeLinkedRefKeyword) Native

Location[] Function GetAllLinkedLocations(Keyword akKeyword) Native

planet Function GetCurrentPlanet() Native

Float Function GetKeywordData(Keyword akKeyword) Native

Int Function GetMaxLevel() Native

Int Function GetMinLevel() Native

Location[] Function GetParentLocations(Keyword apKeyword) Native

Int Function GetRefTypeAliveCount(LocationRefType akRefType) Native

Int Function GetRefTypeDeadCount(LocationRefType akRefType) Native

Float Function GetValue(ActorValue akActorValue) Native

Bool Function HasCommonParent(Location akOther, Keyword akFilter) Native

Bool Function HasEverBeenExplored() Native

Bool Function HasRefType(LocationRefType akRefType) Native

Bool Function IsChild(Location akOther) Native

Bool Function IsExplored() Native

Bool Function IsLinkedLocation(Location akLocation, Keyword akKeyword) Native

Bool Function IsLoaded() Native

Event OnLocationExplored()
  ; Empty function
EndEvent

Event OnLocationLoaded()
  ; Empty function
EndEvent

Function RemoveKeyword(Keyword akKeyword) Native

Function RemoveLinkedLocation(Location akLoc, Keyword akKeyword) Native

Function Reset() Native

Function SetExplored(Bool abExplored) Native

Function SetFactionOwner(Faction akFaction) Native

Function SetKeywordData(Keyword akKeyword, Float afData) Native

Function SetMaxLevel(Int aiMaxLevel) Native

Function SetMinLevel(Int aiMinLevel) Native

Function SetNeverResets(Bool abFlag) Native

Function SetValue(ActorValue akActorValue, Float afValue) Native

Bool Function IsSameLocation(Location akOtherLocation, Keyword akKeyword)
{ Returns true if the calling location is the same as the supplied location - if an optional keyword is supplied, it also returns true if the locations share a parent with that keyword, or if either location is a child of the other and the other has that keyword. }
  Bool bmatching = Self == akOtherLocation
  If !bmatching && akKeyword as Bool
    bmatching = Self.HasCommonParent(akOtherLocation, akKeyword)
    If !bmatching && akOtherLocation.HasKeyword(akKeyword)
      bmatching = akOtherLocation.IsChild(Self)
    ElseIf !bmatching && Self.HasKeyword(akKeyword)
      bmatching = Self.IsChild(akOtherLocation)
    EndIf
  EndIf
  Return bmatching
EndFunction

Function ModifyKeywordData(Keyword akKeyword, Float afData)
  Float currentValue = Self.GetKeywordData(akKeyword)
  Self.SetKeywordData(akKeyword, currentValue + afData)
EndFunction

Function ModValue(ActorValue akActorValue, Float afAmount)
  Float currentValue = Self.GetValue(akActorValue)
  Self.SetValue(akActorValue, currentValue + afAmount)
EndFunction
