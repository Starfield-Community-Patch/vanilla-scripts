ScriptName Fragments:Scenes:SF_MQ101_013A_FlightScene02__0024E1CF Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("ShipSpeed")
EndFunction

Function Fragment_Phase_07_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("ShipBoost")
EndFunction
