ScriptName Fragments:TopicInfos:TIF_TraitQuest_00121737 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property Trait_RaisedUniversalBoxEnabler Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  Trait_RaisedUniversalBoxEnabler.setstage(600)
EndFunction
