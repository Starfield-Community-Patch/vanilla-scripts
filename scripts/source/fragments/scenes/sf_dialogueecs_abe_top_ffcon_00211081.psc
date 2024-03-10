ScriptName Fragments:Scenes:SF_DialogueECS_Abe_Top_FFCon_00211081 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property FFConstantR02MiscQuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_Begin()
  FFConstantR02MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0)
EndFunction
