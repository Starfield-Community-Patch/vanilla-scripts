ScriptName Fragments:Scenes:SF_FC01_RobberLeaderGreet01S_002982A7 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC01_BlakeAnnouncePlayerScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  FC01_BlakeAnnouncePlayerScene.Stop()
EndFunction
