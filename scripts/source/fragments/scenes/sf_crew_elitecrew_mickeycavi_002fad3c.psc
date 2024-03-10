ScriptName Fragments:Scenes:SF_CREW_EliteCrew_MickeyCavi_002FAD3C Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.GiveItemSceneEnded()
EndFunction
