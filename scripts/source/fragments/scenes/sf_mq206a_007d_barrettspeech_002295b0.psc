ScriptName Fragments:Scenes:SF_MQ206A_007d_BarrettSpeech_002295B0 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Barrett Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Barrett.GetActorRef().SetGhost(True)
EndFunction

Function Fragment_End()
  Barrett.GetActorRef().SetGhost(False)
  Self.GetOwningQuest().SetStage(230)
EndFunction
