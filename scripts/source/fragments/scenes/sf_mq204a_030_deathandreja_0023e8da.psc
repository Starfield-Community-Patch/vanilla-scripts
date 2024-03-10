ScriptName Fragments:Scenes:SF_MQ204A_030_DeathAndreja_0023E8DA Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Andreja Auto Const
Keyword Property ExitToDeath Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Andreja.GetActorRef().AddKeyword(ExitToDeath)
EndFunction
