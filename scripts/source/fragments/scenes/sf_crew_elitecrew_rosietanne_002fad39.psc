ScriptName Fragments:Scenes:SF_CREW_EliteCrew_RosieTanne_002FAD39 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.GiveItemSceneEnded()
EndFunction
