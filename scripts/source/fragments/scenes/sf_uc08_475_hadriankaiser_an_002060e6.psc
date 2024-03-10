ScriptName Fragments:Scenes:SF_UC08_475_HadrianKaiser_An_002060E6 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const mandatory
ReferenceAlias Property Kaiser Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Kaiser.GetRef(), None, None)
EndFunction
