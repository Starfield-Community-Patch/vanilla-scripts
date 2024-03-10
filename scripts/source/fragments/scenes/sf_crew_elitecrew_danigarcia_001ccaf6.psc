ScriptName Fragments:Scenes:SF_CREW_EliteCrew_DaniGarcia_001CCAF6 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.PickupSceneEnded()
EndFunction
