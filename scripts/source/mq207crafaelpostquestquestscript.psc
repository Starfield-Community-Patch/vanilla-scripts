ScriptName MQ207CRafaelPostquestQuestScript Extends Quest
{ Quest script for MQ207C_RafaelPostquest, the quest that manages Rafael's transition from Quest NPC to Elite Crew. }

;-- Variables ---------------------------------------
Int CONST_III_DisableInNishinaStage = 110 Const
Int CONST_III_ReadyToDisableInNishinaStage = 100 Const
Int CONST_II_DisableInSettledSystemStage = 40 Const
Int CONST_II_FollowToShipStage = 20 Const
Int CONST_II_PassengerOnShipStage = 30 Const
Int CONST_Post_DisplaySpeakToRafaelStage = 210 Const
Int CONST_Post_WatchForArrivalInNewAtlantisStage = 200 Const

;-- Properties --------------------------------------
Group AutofillProperties
  LocationAlias Property PlayerShipInteriorLocation Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property RafaelAguerro Auto Const mandatory
  Location Property SFreya_PFreyaIII Auto Const mandatory
  Location Property CityNewAtlantisLocation Auto Const mandatory
  Keyword Property LocTypeSettlement Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  Self.UpdatePostquestState(akNewLoc)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSource, Location akOldLoc, Location akNewLoc)
  Self.UpdatePostquestState(akNewLoc)
EndEvent

Function UpdatePostquestState(Location akPlayerLoc)
  If Self.GetStage() == CONST_II_FollowToShipStage && (akPlayerLoc == PlayerShipInteriorLocation.GetLocation() || akPlayerLoc != SFreya_PFreyaIII && !SFreya_PFreyaIII.IsChild(akPlayerLoc))
    Self.SetStage(CONST_II_PassengerOnShipStage)
  EndIf
  If Self.GetStage() == CONST_II_PassengerOnShipStage && (akPlayerLoc.HasKeyword(LocTypeSettlement) || akPlayerLoc.GetParentLocations(LocTypeSettlement).Length > 0) && RafaelAguerro.GetRef().GetCurrentLocation() != akPlayerLoc
    Self.SetStage(CONST_II_DisableInSettledSystemStage)
  EndIf
  If Self.GetStage() == CONST_III_ReadyToDisableInNishinaStage && !akPlayerLoc.IsChild(SFreya_PFreyaIII)
    Self.SetStage(CONST_III_DisableInNishinaStage)
  EndIf
  If Self.GetStage() == CONST_Post_WatchForArrivalInNewAtlantisStage && (akPlayerLoc == CityNewAtlantisLocation || akPlayerLoc.IsChild(CityNewAtlantisLocation))
    Self.SetStage(CONST_Post_DisplaySpeakToRafaelStage)
  EndIf
EndFunction
