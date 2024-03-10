ScriptName Fragments:Scenes:SF_MQ101_016_KreetOrbitScene_00063800 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("PlanetLanding01")
EndFunction
