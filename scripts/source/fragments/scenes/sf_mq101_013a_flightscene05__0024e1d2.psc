ScriptName Fragments:Scenes:SF_MQ101_013A_FlightScene05__0024E1D2 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_03_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  Self.GetOwningQuest().SetObjectiveCompleted(106, True)
  kmyQuest.ShowHelpMessage("ShipWeapons")
EndFunction
