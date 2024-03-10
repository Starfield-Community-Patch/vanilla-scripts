ScriptName Fragments:Scenes:SF_MQ102_005_JackTopLevel_0028A2B8 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_09_Begin()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("CompanionCheck")
EndFunction
