ScriptName Fragments:Quests:QF_UCR04_001E7A0A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UCR04_TimesCompleted Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
MiscObject Property UCR04_SpecimenSample Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
ObjectReference Property UCR04_DebugMarker Auto Const mandatory
GlobalVariable Property UCR04_SamplesTotalRequired Auto Const mandatory
Message Property UCR04_DEBUG_HadrianForKaiser Auto Const mandatory
Quest Property DialogueUCFaction Auto Const mandatory
Perk Property UCR04_HarvestSamplePerk Auto Const mandatory
ReferenceAlias Property Alias_DropOffNPC Auto Const mandatory
Scene Property UCR04_100_Jakob_StartUp Auto Const mandatory
ReferenceAlias Property Alias_RDHQMapMarker Auto Const mandatory
ReferenceAlias Property Alias_ActiveUCR04Instance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  DialogueRedDevilsHQ.SetStage(1)
  Game.GetPlayer().Moveto(Alias_DebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_RDHQMapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  DialogueRedDevilsHQ.SetStage(1)
  Self.SetStage(500)
  Game.GetPlayer().AddItem(UCR04_SpecimenSample as Form, UCR04_SamplesTotalRequired.GetValueInt(), False)
  Game.GetPlayer().Moveto(UCR04_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveCompleted(100, True)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  ucr04questscript kmyQuest = __temp as ucr04questscript
  Alias_ActiveUCR04Instance.ForceRefTo(Game.GetPlayer() as ObjectReference)
  Game.GetPlayer().AddPerk(UCR04_HarvestSamplePerk, False)
  kmyQuest.PrepQuest()
  UCR04_100_Jakob_StartUp.Start()
  If !DialogueRedDevilsHQ.GetStageDone(200)
    DialogueRedDevilsHQ.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(110, False, False)
  Self.SetObjectiveDisplayed(111, False, False)
  Self.SetObjectiveDisplayed(500, True, False)
  Alias_DropOffNPC.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().RemovePerk(UCR04_HarvestSamplePerk)
  ObjectReference XBRef = Alias_DropOffNPC.GetRef()
  If !XBRef.Is3DLoaded() && XBRef.IsEnabled()
    XBRef.Disable(False)
  EndIf
  Self.Stop()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_ActiveUCR04Instance.Clear()
  ObjectReference PlayREF = Game.GetPlayer() as ObjectReference
  PlayREF.RemoveItem(UCR04_SpecimenSample as Form, PlayREF.GetItemCount(UCR04_SpecimenSample as Form), False, None)
  Game.GetPlayer().RemovePerk(UCR04_HarvestSamplePerk)
  ObjectReference XBRef = Alias_DropOffNPC.GetRef()
  If !XBRef.Is3DLoaded() && XBRef.IsEnabled()
    XBRef.Disable(False)
  EndIf
  UCR04_TimesCompleted.SetValue(UCR04_TimesCompleted.GetValue() + 1.0)
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
