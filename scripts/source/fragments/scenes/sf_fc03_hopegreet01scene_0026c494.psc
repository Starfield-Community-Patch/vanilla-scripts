ScriptName Fragments:Scenes:SF_FC03_HopeGreet01Scene_0026C494 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property FC03_Cosette_St1500Marker Auto Const mandatory
ObjectReference Property HT_CosetteRef Auto Const mandatory
Scene Property FC03_CosetteInterruptScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_13_Begin()
  HT_CosetteRef.MoveTo(FC03_Cosette_St1500Marker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Phase_13_End()
  FC03_CosetteInterruptScene.Start()
EndFunction
