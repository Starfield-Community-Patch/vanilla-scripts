ScriptName MQ102Script Extends Quest

;-- Variables ---------------------------------------
inputenablelayer MQ102EnableLayer

;-- Functions ---------------------------------------

Function BlockSpaceTravel()
  Game.SetInChargen(True, False, False)
  MQ102EnableLayer = inputenablelayer.Create()
  MQ102EnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
  MQ102EnableLayer.EnableFastTravel(False)
  MQ102EnableLayer.EnableFarTravel(False)
EndFunction

Function UnblockSpaceTravel()
  MQ102EnableLayer = None
  Game.SetInChargen(False, False, False)
EndFunction
