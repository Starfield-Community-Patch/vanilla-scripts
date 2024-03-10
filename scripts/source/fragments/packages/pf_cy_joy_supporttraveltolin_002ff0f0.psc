ScriptName Fragments:Packages:PF_CY_Joy_SupportTravelToLin_002FF0F0 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DialogueCydoniaConvoSupport01QuestStartKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  DialogueCydoniaConvoSupport01QuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0)
EndFunction
