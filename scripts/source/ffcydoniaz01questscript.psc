ScriptName FFCydoniaZ01QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property FFCydoniaZ01_CargoHalfTotal Auto Const mandatory
GlobalVariable Property FFCydoniaZ01_CargoTotal Auto Const mandatory
RefCollectionAlias Property Cargo Auto Const mandatory
RefCollectionAlias Property Leeches Auto Const mandatory

;-- Functions ---------------------------------------

Function SetLeechesAggressive()
  Leeches.SetValue(Aggression, 2.0)
EndFunction

Event OnQuestInit()
  Int TotalCargo = Cargo.GetCount()
  Int HalfTotalCargo = TotalCargo / 2
  FFCydoniaZ01_CargoTotal.SetValue(TotalCargo as Float)
  FFCydoniaZ01_CargoHalfTotal.SetValue(HalfTotalCargo as Float)
  Self.SetLeechesAggressive()
EndEvent
