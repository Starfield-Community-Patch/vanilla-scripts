ScriptName Fragments:Quests:QF_UCR05_001E7A09 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueUCFaction Auto Const mandatory
GlobalVariable Property UCR05_TimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_EdgeMarker Auto Const mandatory
Scene Property UCR05_100_VV_StartUp Auto Const mandatory
ReferenceAlias Property Alias_TransferSystemTrigger Auto Const mandatory
Book Property UCR05_TargetSlate Auto Const mandatory
Cell Property CityNewAtlantisMASTB3SubsectionSeven Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_EdgeMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(75) && Game.GetPlayer().GetParentCell() != CityNewAtlantisMASTB3SubsectionSeven
    Self.SetStage(9000)
  EndIf
EndFunction

Function Fragment_Stage_0075_Item_00()
  If !DialogueUCFaction.GetStageDone(1020)
    DialogueUCFaction.SetStage(1020)
  EndIf
  Alias_TransferSystemTrigger.GetRef().Enable(False)
  Self.SetObjectiveDisplayed(75, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_TransferSystemTrigger.GetRef().Disable(False)
  Self.SetObjectiveCompleted(75, True)
  Self.SetObjectiveDisplayed(100, True, False)
  If DialogueUCFaction.GetStageDone(4)
    Self.SetActive(True)
  EndIf
  Game.GetPlayer().AddItem(UCR05_TargetSlate as Form, 1, False)
  UCR05_100_VV_StartUp.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  UCR05_TimesCompleted.SetValue(UCR05_TimesCompleted.GetValue() + 1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_TransferSystemTrigger.GetRef().Disable(False)
  If Self.GetStageDone(75)
    Self.SetObjectiveSkipped(75)
  EndIf
  Self.Stop()
EndFunction
