ScriptName COM_Quest_SamCoe_Q01_LocationScript Extends ReferenceAlias
{ Script to ensure quest does not break if player leaves in the middle of Sam's scene with Lillian }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property VictorLocation Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
Scene Property COM_SamCoeQ01_0750_LillianAlert Auto Const mandatory
Keyword Property LinkCustom04 Auto Const mandatory
Int Property PrereqStage = 750 Auto Const
Int Property DoneStage = 775 Auto Const
Int Property DistanceCheck = 10 Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Location myLandingArea = VictorLocation.GetLocation()
  Quest myQuest = Self.GetOwningQuest()
  If myQuest.GetStageDone(PrereqStage) && !myQuest.GetStageDone(DoneStage)
    If akOldLoc == myLandingArea && COM_SamCoeQ01_0750_LillianAlert.IsPlaying()
      COM_SamCoeQ01_0750_LillianAlert.Stop()
    ElseIf akNewLoc == myLandingArea
      ObjectReference SamCoeRef = Alias_SamCoe.GetRef()
      ObjectReference SamCoeFurnitureRef = SamCoeRef.GetLinkedRef(LinkCustom04)
      ObjectReference CoraCoeRef = Alias_CoraCoe.GetRef()
      ObjectReference CoraCoeFurnitureRef = CoraCoeRef.GetLinkedRef(LinkCustom04)
      If SamCoeRef.GetDistance(SamCoeFurnitureRef) > DistanceCheck as Float
        SamCoeRef.MoveTo(SamCoeFurnitureRef, 0.0, 0.0, 0.0, True, False)
      EndIf
      If CoraCoeRef.GetDistance(CoraCoeFurnitureRef) > DistanceCheck as Float
        CoraCoeRef.MoveTo(CoraCoeFurnitureRef, 0.0, 0.0, 0.0, True, False)
      EndIf
      If !COM_SamCoeQ01_0750_LillianAlert.IsPlaying()
        COM_SamCoeQ01_0750_LillianAlert.Start()
      EndIf
    EndIf
  EndIf
EndEvent
