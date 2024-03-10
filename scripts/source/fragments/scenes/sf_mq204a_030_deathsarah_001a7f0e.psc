ScriptName Fragments:Scenes:SF_MQ204A_030_DeathSarah_001A7F0E Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SarahMorgan Auto Const
Keyword Property ExitToDeath Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  SarahMorgan.GetActorRef().AddKeyword(ExitToDeath)
EndFunction
