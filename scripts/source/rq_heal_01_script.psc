ScriptName RQ_Heal_01_Script Extends RQScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Heal_Properties
  ActorValue Property RQ_AV_Heal_01_Hook_Danger Auto Const mandatory
  ActorValue Property RQ_AV_Heal_01_Hook_LeftBehind Auto Const mandatory
  ActorValue Property RQ_AV_Heal_01_Hook_HelpUs Auto Const mandatory
  Int Property DangerLineCount = 3 Auto Const
  { The number of randomly selectable dialogue lines related to the Quest Giver's dangerous situation. }
  Int Property LeftBehindLineCount = 3 Auto Const
  { The number of randomly selectable dialogue lines related to the Quest Giver's circumstances leaving a person behind. }
  Int Property HelpUsLineCount = 3 Auto Const
  { The number of randomly selectable dialogue lines where the Quest Giver asks for help. }
EndGroup

Group DPIERCE_TESTING
  RefCollectionAlias Property Alias_Actors Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SetQuestHookDialogueAVs()
  ObjectReference questGiverRef = Alias_QuestGiver.GetRef()
  Self.SetDialogueAV(RQ_AV_Heal_01_Hook_Danger, Utility.RandomInt(1, DangerLineCount))
  Self.SetDialogueAV(RQ_AV_Heal_01_Hook_LeftBehind, Utility.RandomInt(1, LeftBehindLineCount))
  Self.SetDialogueAV(RQ_AV_Heal_01_Hook_HelpUs, Utility.RandomInt(1, HelpUsLineCount))
EndFunction
