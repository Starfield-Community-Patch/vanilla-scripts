ScriptName Fragments:Scenes:SF_CF03_Stage150_Mathis_Towe_0024EA77 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_07_End()
  If CF03.GetStageDone(175) == True
    CF03.SetStage(170)
  EndIf
EndFunction
