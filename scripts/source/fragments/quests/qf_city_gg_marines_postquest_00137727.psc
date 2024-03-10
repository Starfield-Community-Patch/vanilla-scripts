ScriptName Fragments:Quests:QF_City_GG_Marines_PostQuest_00137727 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueGagarin_UC_GG Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If DialogueGagarin_UC_GG.GetStageDone(1200)
    DialogueGagarin_UC_GG.SetStage(1205)
  EndIf
  If DialogueGagarin_UC_GG.GetStageDone(1210)
    DialogueGagarin_UC_GG.SetStage(1215)
  EndIf
  If DialogueGagarin_UC_GG.GetStageDone(1220)
    DialogueGagarin_UC_GG.SetStage(1225)
  EndIf
  DialogueGagarin_UC_GG.SetStage(1230)
  Self.Stop()
EndFunction
