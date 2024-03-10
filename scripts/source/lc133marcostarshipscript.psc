ScriptName LC133MarcoStarshipScript Extends SpaceshipReference

;-- Functions ---------------------------------------

Event OnLoad()
  (Self as SpaceshipReference).SetExteriorLoadDoorInaccessible(False)
EndEvent
