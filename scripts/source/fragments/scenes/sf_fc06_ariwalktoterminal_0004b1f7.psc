ScriptName Fragments:Scenes:SF_FC06_AriWalkToTerminal_0004B1F7 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property FC06_AriSearchRecords Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  FC06_AriSearchRecords.Start()
  Self.GetOwningQuest().SetStage(420)
EndFunction
