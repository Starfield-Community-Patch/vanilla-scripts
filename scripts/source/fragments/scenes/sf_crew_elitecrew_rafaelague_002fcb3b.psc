ScriptName Fragments:Scenes:SF_CREW_EliteCrew_RafaelAgue_002FCB3B Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.GiveItemSceneEnded()
EndFunction
