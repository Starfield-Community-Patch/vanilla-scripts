ScriptName Fragments:Packages:PF_CY_UniversumServiceHorusT_00182FD0 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DialogueCydoniaConvoService01QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  DialogueCydoniaConvoService01QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
EndFunction
