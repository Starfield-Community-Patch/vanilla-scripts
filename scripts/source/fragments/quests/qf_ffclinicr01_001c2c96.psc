ScriptName Fragments:Quests:QF_FFClinicR01_001C2C96 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Target Auto Const mandatory
ReferenceAlias Property Alias_AlexeiLebedev Auto Const mandatory
ReferenceAlias Property Alias_JosephManning Auto Const mandatory
ReferenceAlias Property Alias_CharlieFlynn Auto Const mandatory
LocationAlias Property Alias_TargetLocation Auto Const mandatory
GlobalVariable Property FFClinicR01Completions Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  ffclinicr01questscript kmyQuest = __temp as ffclinicr01questscript
  kmyQuest.Target_Var = Utility.RandomInt(1, 3)
  If kmyQuest.Target_Var == 1
    Alias_Target.ForceRefTo(Alias_AlexeiLebedev.GetReference())
  ElseIf kmyQuest.Target_Var == 2
    Alias_Target.ForceRefTo(Alias_JosephManning.GetReference())
  ElseIf kmyQuest.Target_Var == 3
    Alias_Target.ForceRefTo(Alias_CharlieFlynn.GetReference())
  EndIf
  Alias_TargetLocation.ForceLocationTo(Alias_Target.GetReference().GetEditorLocation())
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Game.GetPlayer().AddItem(Alias_Slate.GetReference() as Form, 1, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().RemoveItem(Alias_Slate.GetReference() as Form, 1, False, None)
  FFClinicR01Completions.SetValue(FFClinicR01Completions.GetValue() + 1.0)
  Self.Stop()
EndFunction
