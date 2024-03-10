ScriptName Fragments:Quests:QF_DialogueUCFactionAlwaysOn_0014618F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ReconstructionMarker Auto Const mandatory
GlobalVariable Property UC04_PostAttackDialogueActive Auto Const mandatory
ReferenceAlias Property Alias_OverhangMarker Auto Const mandatory
Quest Property DialogueUCFactionNewAtlantis Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest
  ucparentfactionquestscript kmyQuest = __temp as ucparentfactionquestscript
  kmyQuest.BeginStateChangeTimer()
  DialogueUCFactionNewAtlantis.SetStage(990)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_ReconstructionMarker.GetRef().Enable(False)
  Alias_OverhangMarker.GetRef().Enable(False)
  UC04_PostAttackDialogueActive.SetValue(0.0)
  DialogueUCFactionNewAtlantis.SetStage(1000)
EndFunction
