ScriptName Fragments:Scenes:SF_MQ302_310_ConfrontHunter_0018A2B8 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MusicType Property MUSGenesisStingerStarbornAppearC Auto Const mandatory

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
  MUSGenesisStingerStarbornAppearC.add()
EndFunction
