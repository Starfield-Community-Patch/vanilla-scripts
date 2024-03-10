ScriptName Fragments:Scenes:SF_MQ101_013B_SpaceCombatSce_000058C0 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("WeaponGroup1")
EndFunction

Function Fragment_Phase_07_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("WeaponGroup3")
EndFunction
