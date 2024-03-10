ScriptName Fragments:Scenes:SF_CREW_EliteCrew_AutumnMacM_0019C1A8 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.WaitSceneEnded()
EndFunction
