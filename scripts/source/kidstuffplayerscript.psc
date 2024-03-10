ScriptName KidStuffPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
Keyword Property LinkCustom02 Auto Const mandatory
Location Property CityNewAtlantisKidStuffHomeLocation Auto Const mandatory
Location Property CityAkilaCityLocation Auto Const mandatory
Location Property CityNeonTradeTowerAstralLoungeLocation Auto Const mandatory
ReferenceAlias Property Dad Auto Const
ReferenceAlias Property Mom Auto Const
ReferenceAlias Property LodgeMarker Auto Const

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Quest MyQuest = Self.GetOwningQuest()
  ObjectReference oDad = Dad.GetRef()
  ObjectReference oMom = Mom.GetRef()
  If !MyQuest.GetStageDone(300) && MyQuest.GetStageDone(30) && LodgeMarker.GetRef().IsDisabled()
    MyQuest.SetStage(40)
  EndIf
  If MyQuest.GetStageDone(300)
    If akNewLoc == CityNewAtlantisKidStuffHomeLocation
      oDad.MoveTo(oDad.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
      oMom.MoveTo(oDad.GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
    EndIf
    If akNewLoc == CityNeonTradeTowerAstralLoungeLocation && !MyQuest.GetStageDone(2000)
      oDad.MoveTo(oDad.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False)
      (oDad as Actor).EvaluatePackage(False)
      oMom.MoveTo(oDad.GetLinkedRef(LinkCustom01), 0.0, 0.0, 0.0, True, False)
      (oMom as Actor).EvaluatePackage(False)
    EndIf
    If akNewLoc == CityAkilaCityLocation && !MyQuest.GetStageDone(2100)
      oDad.MoveTo(oDad.GetLinkedRef(LinkCustom02), 0.0, 0.0, 0.0, True, False)
      (oDad as Actor).EvaluatePackage(False)
      oMom.MoveTo(oDad.GetLinkedRef(LinkCustom02), 0.0, 0.0, 0.0, True, False)
      (oMom as Actor).EvaluatePackage(False)
    EndIf
  EndIf
EndEvent
