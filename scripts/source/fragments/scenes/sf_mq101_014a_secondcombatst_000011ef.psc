ScriptName Fragments:Scenes:SF_MQ101_014A_SecondCombatSt_000011EF Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  defaulttutorialquestscript kmyQuest = Self.GetOwningQuest() as defaulttutorialquestscript
  kmyQuest.ShowHelpMessage("ShipLoot")
EndFunction
