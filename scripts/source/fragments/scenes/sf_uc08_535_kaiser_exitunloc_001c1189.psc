ScriptName Fragments:Scenes:SF_UC08_535_Kaiser_ExitUnloc_001C1189 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property UC08_DEBUG_TransmitUnlockSound Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  UC08_DEBUG_TransmitUnlockSound.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction
