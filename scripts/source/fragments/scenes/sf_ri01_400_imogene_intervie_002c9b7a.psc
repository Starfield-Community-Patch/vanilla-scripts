ScriptName Fragments:Scenes:SF_RI01_400_Imogene_Intervie_002C9B7A Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  ri01_questscript kmyQuest = Self.GetOwningQuest() as ri01_questscript
  kmyQuest.UnfreezeControls()
  Self.GetOwningQuest().SetStage(420)
EndFunction
