ScriptName LC057BanditStarshipScript Extends SpaceshipReference

;-- Functions ---------------------------------------

Event OnLoad()
  (Self as SpaceshipReference).SetExteriorLoadDoorInaccessible(False)
EndEvent
