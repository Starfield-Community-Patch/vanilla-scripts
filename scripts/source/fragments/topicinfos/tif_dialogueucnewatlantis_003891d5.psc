ScriptName Fragments:TopicInfos:TIF_DialogueUCNewAtlantis_003891D5 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC_NA_SalinasVendorActive Auto Const mandatory
ActorBase Property UC_NA_VicenteSalinas Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor
  UC_NA_SalinasVendorActive.SetValue(1.0)
  UC_NA_VicenteSalinas.GetUniqueActor().EvaluatePackage(False)
EndFunction
