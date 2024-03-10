ScriptName Fragments:Scenes:SF_CREW_EliteCrew_BettyHowse_0014E856 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.FollowSceneEnded()
EndFunction
