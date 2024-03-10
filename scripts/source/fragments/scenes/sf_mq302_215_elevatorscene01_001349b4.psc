ScriptName Fragments:Scenes:SF_MQ302_215_ElevatorScene01_001349B4 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(True)
  kmyQuest.DisableElevator01()
EndFunction

Function Fragment_Phase_01_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(False)
EndFunction

Function Fragment_Phase_03_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetupElevators()
EndFunction

Function Fragment_Phase_06_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.PlayElevator01NoWait()
EndFunction
