ScriptName Fragments:Scenes:SF_City_AkilaLife03_200_TL_S_0011234B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property AkilaLife03_BookReturnCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  Float fCount = AkilaLife03_BookReturnCount.GetValue()
  If fCount == 8.0
    Self.GetOwningQuest().SetStage(9000)
  EndIf
EndFunction
