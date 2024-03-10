ScriptName Fragments:Quests:QF_FFDenR01_001E7942 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FFDenR01_Poster Auto Const mandatory
ReferenceAlias Property Alias_Poster01Activator Auto Const mandatory
ReferenceAlias Property Alias_Poster02Activator Auto Const mandatory
ReferenceAlias Property Alias_DenPosters Auto Const mandatory
ReferenceAlias Property Alias_Poster03Activator Auto Const mandatory
ReferenceAlias Property Alias_Poster01Static Auto Const mandatory
ReferenceAlias Property Alias_Poster02Static Auto Const mandatory
ReferenceAlias Property Alias_Poster03Static Auto Const mandatory
LocationAlias Property Alias_NewAtlantisLocation Auto Const mandatory
LocationAlias Property Alias_TargetLocation Auto Const mandatory
GlobalVariable Property pFFDenR01_Completions Auto Const mandatory
ReferenceAlias Property Alias_Poster01Misc03 Auto Const mandatory
ReferenceAlias Property Alias_Poster01Misc01 Auto Const mandatory
ReferenceAlias Property Alias_Poster01Misc02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(15, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(15)
    Self.SetObjectiveCompleted(15, True)
  EndIf
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_DenPosters.GetReference().Enable(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Game.GetPlayer().AddItem(Alias_Poster01Misc01.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Poster01Misc02.GetRef() as Form, 1, False)
  Game.GetPlayer().AddItem(Alias_Poster01Misc03.GetRef() as Form, 1, False)
  Alias_Poster01Activator.GetReference().Enable(False)
  Alias_Poster02Activator.GetReference().Enable(False)
  Alias_Poster03Activator.GetReference().Enable(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
EndFunction

Function Fragment_Stage_0041_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Poster01Misc01.GetRef() as Form, 1, False, None)
  Alias_Poster01Activator.GetReference().GetLinkedRef(None).Enable(False)
  If Self.GetStageDone(42) && Self.GetStageDone(43)
    Self.SetStage(100)
  EndIf
EndFunction

Function Fragment_Stage_0042_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Poster01Misc02.GetRef() as Form, 1, False, None)
  Alias_Poster02Activator.GetReference().GetLinkedRef(None).Enable(False)
  If Self.GetStageDone(41) && Self.GetStageDone(43)
    Self.SetStage(100)
  EndIf
EndFunction

Function Fragment_Stage_0043_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Poster01Misc03.GetRef() as Form, 1, False, None)
  Alias_Poster03Activator.GetReference().GetLinkedRef(None).Enable(False)
  If Self.GetStageDone(41) && Self.GetStageDone(42)
    Self.SetStage(100)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Poster01Static.GetReference().Disable(False)
  Alias_Poster02Static.GetReference().Disable(False)
  Alias_Poster03Static.GetReference().Disable(False)
  pFFDenR01_Completions.SetValue((pFFDenR01_Completions.GetValue() as Int + 1) as Float)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
