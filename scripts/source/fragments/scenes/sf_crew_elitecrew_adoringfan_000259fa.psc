ScriptName Fragments:Scenes:SF_CREW_EliteCrew_AdoringFan_000259FA Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.PickupSceneEnded()
  Self.GetOwningQuest().SetStage(10)
EndFunction
