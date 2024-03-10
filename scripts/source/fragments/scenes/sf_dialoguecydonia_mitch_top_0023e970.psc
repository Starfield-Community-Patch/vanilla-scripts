ScriptName Fragments:Scenes:SF_DialogueCydonia_Mitch_Top_0023E970 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFCydoniaR03 Auto Const mandatory
Keyword Property FFCydoniaR03QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_06_End()
  FFCydoniaR03QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
EndFunction
