ScriptName Fragments:Scenes:SF_UC08_490_FollowKaiserToSp_001C1196 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property UC08_DEBUG_MultipleTransmitUnlockSounds Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail Auto Const mandatory
ReferenceAlias Property Kaiser Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC08_Robot_Remote_Unlock Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail.Play(Kaiser.GetRef(), None, None)
EndFunction

Function Fragment_Phase_07_Begin()
  WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail.Play(Kaiser.GetRef(), None, None)
EndFunction

Function Fragment_Phase_09_Begin()
  WwiseEvent_QST_UC08_LargeDoor_Remote_Unlock_Fail.Play(Kaiser.GetRef(), None, None)
EndFunction

Function Fragment_Phase_17_Begin()
  WwiseEvent_QST_UC08_Robot_Remote_Unlock.Play(Kaiser.GetRef(), None, None)
EndFunction
