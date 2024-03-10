ScriptName CF01DialogueCrimeGuardsScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer inputLayer

;-- Functions ---------------------------------------

Function DisablePlayerControlsForCF01Arrest()
  inputLayer = inputenablelayer.Create()
  inputLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
EndFunction

Function EnablePlayerControlsAfterCF01Arrest()
  inputLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  inputLayer.Delete()
EndFunction
