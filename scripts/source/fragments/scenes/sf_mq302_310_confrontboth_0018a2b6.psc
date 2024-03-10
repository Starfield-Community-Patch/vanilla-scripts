ScriptName Fragments:Scenes:SF_MQ302_310_ConfrontBoth_0018A2B6 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MusicType Property MUSGenesisStingerStarbornAppearB Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(False)
EndFunction

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.SetPlayerControlsEnabled(True)
EndFunction

Function Fragment_Phase_01_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript
  kmyQuest.StarbornAdversaryTeleportInForConfrontation(False)
  MUSGenesisStingerStarbornAppearB.Add()
EndFunction
