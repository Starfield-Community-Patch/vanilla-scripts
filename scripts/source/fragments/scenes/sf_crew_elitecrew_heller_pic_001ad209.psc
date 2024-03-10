ScriptName Fragments:Scenes:SF_CREW_EliteCrew_Heller_Pic_001AD209 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.PickupSceneEnded()
EndFunction
