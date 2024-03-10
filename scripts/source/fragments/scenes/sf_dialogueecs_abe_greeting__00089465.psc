ScriptName Fragments:Scenes:SF_DialogueECS_Abe_Greeting__00089465 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFConstantR02MiscQuestStartKeyword Auto Const mandatory
Quest Property FFConstantR02Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  FFConstantR02MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction

Function Fragment_Phase_01_End()
  FFConstantR02Misc.SetStage(101)
EndFunction
