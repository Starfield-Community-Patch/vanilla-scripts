ScriptName Fragments:Scenes:SF_MQ206A_007b_MatteoSpeech_002295AF Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MatteoKhatri Auto Const

;-- Functions ---------------------------------------

Function Fragment_Begin()
  MatteoKhatri.GetActorRef().SetGhost(True)
EndFunction

Function Fragment_End()
  MatteoKhatri.GetActorRef().SetGhost(False)
  Self.GetOwningQuest().SetStage(220)
EndFunction
