ScriptName Fragments:Scenes:SF_MQ204A_030b_DeathSamScene_002C6CFE Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SamCoe Auto Const
Keyword Property ExitToDeath Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  SamCoe.GetActorRef().AddKeyword(ExitToDeath)
EndFunction
