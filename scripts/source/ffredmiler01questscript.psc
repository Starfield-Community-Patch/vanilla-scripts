ScriptName FFRedMileR01QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer FastTravelInputLayer

;-- Properties --------------------------------------
Quest Property RedMile_HandlerQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function RMDisableFastTravel()
  FastTravelInputLayer = inputenablelayer.Create()
  FastTravelInputLayer.EnableFastTravel(False)
  FastTravelInputLayer.EnableTakeoff(False)
EndFunction

Function RMEnableFastTravel()
  If FastTravelInputLayer != None
    FastTravelInputLayer.EnableFastTravel(True)
    FastTravelInputLayer.EnableTakeoff(True)
    FastTravelInputLayer.Delete()
    FastTravelInputLayer = None
  EndIf
EndFunction

Function SpawnCreatures(Int aiPhase)
  (RedMile_HandlerQuest as redmilehandlerquestscript).RespawnCreatures(aiPhase)
EndFunction
