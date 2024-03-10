ScriptName SQ_ShipTechLanding_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property ShipTechnicians Auto Const
Scene Property SQ_ShipTechniciansLandingScene Auto Const
Quest Property SQ_ShipTechniciansLanding Auto Const mandatory

;-- Functions ---------------------------------------

Event OnHomeShipSet(spaceshipreference akShip, spaceshipreference akPrevious)
  SQ_ShipTechniciansLanding.SetStage(200)
  Int I = 0
  Int iLength = ShipTechnicians.GetCount()
  While I < iLength
    Actor CurrentShipTech = ShipTechnicians.GetAt(I) as Actor
    If CurrentShipTech.IsDead() == False && CurrentShipTech.IsDisabled() == False
      CurrentShipTech.MoveToMyEditorLocation()
      CurrentShipTech.Reset(None)
      CurrentShipTech.EvaluatePackage(False)
    EndIf
    I += 1
  EndWhile
  SQ_ShipTechniciansLandingScene.Stop()
  SQ_ShipTechniciansLanding.Stop()
EndEvent
