ScriptName Fragments:Scenes:SF_City_NA_Botany02_Stage60__00261A4B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property DataSlate Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  Game.GetPlayer().AddItem(DataSlate.GetRef() as Form, 1, False)
EndFunction
