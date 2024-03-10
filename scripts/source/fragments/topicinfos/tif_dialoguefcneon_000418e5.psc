ScriptName Fragments:TopicInfos:TIF_DialogueFCNeon_000418E5 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property pNeon_EvictedSleepcrate_Global Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  pNeon_EvictedSleepcrate_Global.Mod(1.0)
EndFunction
