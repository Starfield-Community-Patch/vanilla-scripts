ScriptName Fragments:Scenes:SF_MQ302_220_EyeScene01_00155995 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MQ302bOtherYou Auto Const
Keyword Property ExitToDeath Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  MQ302bOtherYou.GetActorRef().addKeyword(ExitToDeath)
EndFunction
