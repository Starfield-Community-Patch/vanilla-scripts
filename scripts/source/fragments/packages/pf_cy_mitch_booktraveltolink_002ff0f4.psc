ScriptName Fragments:Packages:PF_CY_Mitch_BookTravelToLink_002FF0F4 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DialogueCydoniaConvoBook01QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  DialogueCydoniaConvoBook01QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
EndFunction
