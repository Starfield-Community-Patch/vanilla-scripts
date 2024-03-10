ScriptName Fragments:Scenes:SF_MQ204A_030_DeathBarrett_001A7F0F Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Barrett Auto Const
Keyword Property ExitToDeath Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Barrett.GetActorRef().addKeyword(ExitToDeath)
EndFunction
