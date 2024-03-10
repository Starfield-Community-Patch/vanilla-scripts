ScriptName Fragments:Scenes:SF_SE_FAB01_100b_HailingAnsw_0008981E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  se_fab04_mathcount kmyQuest = Self.GetOwningQuest() as se_fab04_mathcount
  kmyQuest.CountShipParts()
EndFunction
