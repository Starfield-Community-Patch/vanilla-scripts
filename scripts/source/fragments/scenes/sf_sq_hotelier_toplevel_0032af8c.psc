ScriptName Fragments:Scenes:SF_SQ_Hotelier_TopLevel_0032AF8C Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  sq_hoteliersquestscript kmyQuest = Self.GetOwningQuest() as sq_hoteliersquestscript
  kmyQuest.SetRoomPrices()
EndFunction
