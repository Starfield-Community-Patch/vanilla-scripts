ScriptName Fragments:Scenes:SF_UC08_513_HadrianKaiser_Un_001C1193 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock Auto Const mandatory
ReferenceAlias Property Kaiser Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_04_Begin()
  WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock.Play(Kaiser.GetRef(), None, None)
EndFunction
