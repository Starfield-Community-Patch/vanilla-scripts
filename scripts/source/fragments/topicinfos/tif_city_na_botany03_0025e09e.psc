ScriptName Fragments:TopicInfos:TIF_City_NA_Botany03_0025E09E Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TreeBranch Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Game.GetPlayer().AddItem(TreeBranch.GetReference() as Form, 1, False)
EndFunction
