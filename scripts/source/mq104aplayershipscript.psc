ScriptName MQ104APlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property Planet01ScanStage = 24 Auto Const
Int Property Planet02ScanStage = 34 Auto Const
Int Property ScanPrereqStage = 20 Auto Const
LocationAlias Property Location01Planet Auto Const mandatory
LocationAlias Property Location02Planet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipScan(Location aPlanet, ObjectReference[] aMarkersArray)
  Location Planet01Loc = Location01Planet.GetLocation()
  Location Planet02Loc = Location02Planet.GetLocation()
  Quest myQuest = Self.GetOwningQuest()
  If aPlanet == Planet01Loc && myQuest.GetStageDone(ScanPrereqStage) && myQuest.GetStageDone(Planet01ScanStage) == False
    myQuest.SetStage(Planet01ScanStage)
  ElseIf aPlanet == Planet02Loc && myQuest.GetStageDone(ScanPrereqStage) && myQuest.GetStageDone(Planet02ScanStage) == False
    myQuest.SetStage(Planet02ScanStage)
  EndIf
EndEvent
