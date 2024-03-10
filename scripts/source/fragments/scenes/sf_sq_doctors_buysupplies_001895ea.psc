ScriptName Fragments:Scenes:SF_SQ_Doctors_BuySupplies_001895EA Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  sq_doctorsscript kmyQuest = Self.GetOwningQuest() as sq_doctorsscript
  kmyQuest.BuySupplies()
EndFunction
