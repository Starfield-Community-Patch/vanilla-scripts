ScriptName Fragments:Scenes:SF_CREW_EliteCrew_AndromedaK_0016B3CC Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.FollowSceneEnded()
EndFunction
