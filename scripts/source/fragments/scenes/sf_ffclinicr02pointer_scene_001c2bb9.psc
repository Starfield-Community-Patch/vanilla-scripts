ScriptName Fragments:Scenes:SF_FFClinicR02Pointer_Scene_001C2BB9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFClinicR02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  FFClinicR02.Start()
EndFunction

Function Fragment_Phase_03_End()
  FFClinicR02.SetStage(10)
EndFunction
