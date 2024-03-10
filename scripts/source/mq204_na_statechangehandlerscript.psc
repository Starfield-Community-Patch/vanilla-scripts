ScriptName MQ204_NA_StateChangeHandlerScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityNewAtlantisLocation Auto Const
Int Property LeftNAStageToSet = 100 Auto Const
Int Property LeftNAPrereqStage = 10 Auto Const
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip as ScriptObject, "OnLocationChange")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer()
    If Self.GetStageDone(LeftNAPrereqStage)
      If akOldLoc == CityNewAtlantisLocation || akOldLoc.IsChild(CityNewAtlantisLocation)
        If akSender.IsInLocation(CityNewAtlantisLocation) == False
          Self.SetStage(LeftNAStageToSet)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == SQ_PlayerShip.PlayerShip
    If Self.GetStageDone(LeftNAPrereqStage)
      If akOldLoc == CityNewAtlantisLocation || akOldLoc.IsChild(CityNewAtlantisLocation)
        If akSender.GetRef().IsInLocation(CityNewAtlantisLocation) == False
          Self.SetStage(LeftNAStageToSet)
        EndIf
      EndIf
    EndIf
  EndIf
EndEvent
