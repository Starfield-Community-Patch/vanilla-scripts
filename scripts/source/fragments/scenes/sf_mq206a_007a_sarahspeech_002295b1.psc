ScriptName Fragments:Scenes:SF_MQ206A_007a_SarahSpeech_002295B1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SarahMorgan Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  SarahMorgan.getactorRef().SetGhost(True)
EndFunction

Function Fragment_End()
  SarahMorgan.getactorRef().SetGhost(False)
  Self.GetOwningQuest().SetStage(210)
EndFunction
