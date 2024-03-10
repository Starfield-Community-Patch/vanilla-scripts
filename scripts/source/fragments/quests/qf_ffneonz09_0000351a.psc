ScriptName Fragments:Quests:QF_FFNeonZ09_0000351A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_PaperActivator01 Auto Const mandatory
ReferenceAlias Property Alias_PaperActivator02 Auto Const mandatory
ReferenceAlias Property Alias_PaperActivator03 Auto Const mandatory
GlobalVariable Property FFNeonZ09_PapersCollected Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Book Property FFNeonZ09_Note01 Auto Const mandatory
Book Property FFNeonZ09_Note02 Auto Const mandatory
Book Property FFNeonZ09_Note03 Auto Const mandatory
Book Property FFNeonZ09_HamzaSlate Auto Const mandatory
ReferenceAlias Property Alias_Napkin01 Auto Const mandatory
ReferenceAlias Property Alias_Napkin02 Auto Const mandatory
ReferenceAlias Property Alias_Napkin03 Auto Const mandatory
ReferenceAlias Property Alias_HamzaSlate Auto Const mandatory
Quest Property FFNeonGuardPointer_Z09 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  FFNeonGuardPointer_Z09.SetStage(200)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(20, True, False)
  Alias_EnableMarker.GetRef().EnableNoWait(False)
  Alias_PaperActivator01.GetRef().EnableNoWait(False)
  Alias_PaperActivator02.GetRef().EnableNoWait(False)
  Alias_PaperActivator03.GetRef().EnableNoWait(False)
  Alias_Napkin01.GetRef().EnableNoWait(False)
  Alias_Napkin02.GetRef().EnableNoWait(False)
  Alias_Napkin03.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  FFNeonZ09_PapersCollected.Mod(1.0)
  Self.UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected)
  Self.SetObjectiveDisplayed(20, True, True)
EndFunction

Function Fragment_Stage_0030_Item_01()
  Self.SetStage(60)
EndFunction

Function Fragment_Stage_0040_Item_00()
  FFNeonZ09_PapersCollected.Mod(1.0)
  Self.UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected)
  Self.SetObjectiveDisplayed(20, True, True)
EndFunction

Function Fragment_Stage_0040_Item_01()
  Self.SetStage(60)
EndFunction

Function Fragment_Stage_0050_Item_00()
  FFNeonZ09_PapersCollected.Mod(1.0)
  Self.UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected)
  Self.SetObjectiveDisplayed(20, True, True)
EndFunction

Function Fragment_Stage_0050_Item_01()
  Self.SetStage(60)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(60, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True)
  Self.SetObjectiveDisplayed(70, True, False)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  PlayerRef.RemoveItem(Alias_Napkin01.GetRef() as Form, 1, False, None)
  PlayerRef.RemoveItem(Alias_Napkin02.GetRef() as Form, 1, False, None)
  PlayerRef.RemoveItem(Alias_Napkin03.GetRef() as Form, 1, False, None)
  PlayerRef.AddAliasedItem(FFNeonZ09_HamzaSlate as Form, Alias_HamzaSlate as Alias, 1, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  If Self.GetStageDone(70)
    Game.GetPlayer().RemoveItem(Alias_HamzaSlate.GetRef() as Form, 1, False, None)
  EndIf
  Alias_EnableMarker.GetRef().DisableNoWait(False)
  DialogueFCNeon.SetStage(499)
  Alias_PaperActivator01.GetRef().DisableNoWait(False)
  Alias_PaperActivator02.GetRef().DisableNoWait(False)
  Alias_PaperActivator03.GetRef().DisableNoWait(False)
EndFunction
