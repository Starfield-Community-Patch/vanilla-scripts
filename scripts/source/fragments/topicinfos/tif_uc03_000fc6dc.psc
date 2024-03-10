ScriptName Fragments:TopicInfos:TIF_UC03_000FC6DC Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC03_DrugNameIndexHolding Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  UC03_DrugNameIndexHolding.SetValue(2.0)
EndFunction
