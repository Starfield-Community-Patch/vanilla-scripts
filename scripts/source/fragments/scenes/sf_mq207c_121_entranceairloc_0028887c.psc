ScriptName Fragments:Scenes:SF_MQ207C_121_EntranceAirloc_0028887C Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property WwiseEvent_QST_MQ207C_Scanner_Confirmation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_03_Begin()
  WwiseEvent_QST_MQ207C_Scanner_Confirmation.Play(Game.GetPlayer() as ObjectReference, None, None)
EndFunction
