ScriptName MQ106SpaceEncounter01Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TheHelix Auto Const mandatory
ReferenceAlias Property TheHelixMovetoMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  spaceshipreference HelixREF = TheHelix.GetShipRef()
  HelixREF.moveto(TheHelixMovetoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  HelixREF.EnableWithGravJump()
EndEvent
