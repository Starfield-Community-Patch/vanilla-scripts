ScriptName Fragments:Scenes:SF_MQ101_013d_ShieldsDownSce_000FED06 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("WeaponGroup2")
EndFunction
