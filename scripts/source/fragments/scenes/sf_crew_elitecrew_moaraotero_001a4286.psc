ScriptName Fragments:Scenes:SF_CREW_EliteCrew_MoaraOtero_001A4286 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  crew_elitecrewquestscript kmyQuest = Self.GetOwningQuest() as crew_elitecrewquestscript
  kmyQuest.Recruited()
EndFunction
