ScriptName Fragments:Scenes:SF_DBTestPCMAI_InvestigatePa_001F6311 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  dbtestpcmaiscript kmyQuest = Self.GetOwningQuest() as dbtestpcmaiscript
  kmyQuest.CheckForNearbyPackin()
EndFunction
