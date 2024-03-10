ScriptName Fragments:Scenes:SF_MQ103_07_JacobPlayerDialo_002A1792 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("CompanionCheck")
EndFunction
