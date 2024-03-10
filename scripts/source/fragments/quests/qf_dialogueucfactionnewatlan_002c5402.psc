ScriptName Fragments:Quests:QF_DialogueUCFactionNewAtlan_002C5402 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
LeveledItem Property LL_Credits_Medium Auto Const mandatory
ReferenceAlias Property Alias_TarmacEnableMarker Auto Const mandatory
GlobalVariable Property UC04_PostAttackDialogueActive Auto Const mandatory
Scene Property DialogueUCNewAtlantisUCFaction_POST_TualaAttract Auto Const mandatory
Message Property UC09_DEBUG_TualasContinuance Auto Const mandatory
GlobalVariable Property UC09_PlayerChoiceResult Auto Const mandatory
Quest Property UC09 Auto Const mandatory
GlobalVariable Property UC09_Result Auto Const mandatory
ObjectReference Property UCR01_DebugMarker Auto Const mandatory
Quest Property UC02 Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
ObjectReference Property UCR05_DebugMarker Auto Const mandatory
GlobalVariable Property CreditsRewardFactionQuestLarge Auto Const mandatory
ReferenceAlias Property Alias_TualaLookatMarker Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Perk Property UC_CitizenVendorDiscount_Rank02 Auto Const mandatory
Perk Property UC_CitizenVendorDiscount_Rank01 Auto Const mandatory
Message Property UC09_DEBUG_Zora Auto Const mandatory
ObjectReference Property UC_TualaTravelMaker Auto Const mandatory
ReferenceAlias Property Alias_Tuala Auto Const mandatory
Quest Property UCR01 Auto Const mandatory
Quest Property UCR03 Auto Const mandatory
ReferenceAlias Property Alias_ZoraSangweni Auto Const
ReferenceAlias Property Alias_VVEntrance Auto Const mandatory
ReferenceAlias Property Alias_MuseumPatron_Child Auto Const mandatory
ReferenceAlias Property Alias_MuseumPatron_Dad Auto Const mandatory
ReferenceAlias Property Alias_Pacifist Auto Const mandatory
GlobalVariable Property UC01_MuralsViewedGlobal Auto Const mandatory
RefCollectionAlias Property Alias_SpaceportGuards Auto Const mandatory
ReferenceAlias Property Alias_SS7FloorManager Auto Const mandatory
Quest Property UC09_PostQuest_VaeVictis_Misc Auto Const mandatory
Quest Property UC09_PostQuest_Tuala_Misc Auto Const mandatory
Quest Property UC09_PostQuest_Percival_Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0300_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0001_Item_00()
  UC01.SetStage(1000)
  UC02.SetObjectiveCompleted(100, True)
  UC02.Stop()
  UC09.SetStage(500)
  UC09_Result.SetValue(2.0)
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(2.0)
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  UC01.SetStage(1000)
  UC02.SetObjectiveCompleted(100, True)
  UC02.Stop()
  UC09.SetStage(500)
  UC09_Result.SetValue(1.0)
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(2.0)
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  UC01.SetStage(1000)
  UC02.SetObjectiveCompleted(100, True)
  UC02.Stop()
  UC09.SetStage(500)
  UC09_Result.SetValue(1.0)
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(2.0)
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  UC09.Start()
  Utility.Wait(1.0)
  UC09.SetStage(200)
  UC09.SetStage(340)
  UC09.SetStage(500)
  Game.GetPlayer().MoveTo(UCR05_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Self.SetObjectiveDisplayed(500, False, False)
  Alias_VVEntrance.GetRef().Unlock(False)
  (Alias_SS7FloorManager.GetRef() as loadelevatorfloorscript).SetAccessible(True)
EndFunction

Function Fragment_Stage_0005_Item_00()
  UC01.SetStage(1000)
  UC02.SetObjectiveCompleted(100, True)
  UC02.Stop()
  UC09.SetStage(500)
  UC09_Result.SetValue(1.0)
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(2.0)
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetStage(550)
  UCR01.Start()
EndFunction

Function Fragment_Stage_0006_Item_00()
  UC01.SetStage(1000)
  UC02.SetObjectiveCompleted(100, True)
  UC02.Stop()
  UC09.SetStage(500)
  UC09_Result.SetValue(2.0)
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(2.0)
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetStage(550)
  UCR01.Start()
EndFunction

Function Fragment_Stage_0007_Item_00()
  UC01.SetStage(1000)
  UC02.SetObjectiveCompleted(100, True)
  UC02.Stop()
  UC09.SetStage(500)
  UC09_Result.SetValue(1.0)
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(2.0)
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False)
  Utility.Wait(1.0)
  Self.SetStage(550)
  UCR03.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0021_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0023_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0024_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0031_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0032_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0040_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0051_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0200_Item_00()
  UC01.Start()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Game.GetPlayer().AddItem(LL_Credits_Medium as Form, 1, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  UC09_PostQuest_Tuala_Misc.Start()
  If !UC09.GetStageDone(320)
    UC09_PostQuest_VaeVictis_Misc.Start()
  EndIf
EndFunction

Function Fragment_Stage_0525_Item_00()
  Actor PlayACT = Game.GetPlayer()
  PlayACT.AddItem(Credits as Form, CreditsRewardFactionQuestLarge.GetValueInt(), False)
  PlayACT.RemovePerk(UC_CitizenVendorDiscount_Rank01)
  PlayACT.AddPerk(UC_CitizenVendorDiscount_Rank02, False)
EndFunction

Function Fragment_Stage_0550_Item_00()
  UC09_PostQuest_Tuala_Misc.SetStage(1000)
  Alias_ZoraSangweni.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  UC09_PostQuest_Percival_Misc.Start()
EndFunction

Function Fragment_Stage_0650_Item_00()
  UC09_PostQuest_Percival_Misc.SetStage(1000)
EndFunction

Function Fragment_Stage_0990_Item_00()
  Alias_MuseumPatron_Child.GetRef().Disable(False)
  Alias_MuseumPatron_Dad.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Int I = 0
  Int iCount = Alias_SpaceportGuards.GetCount()
  While I < iCount
    Actor currAct = Alias_SpaceportGuards.GetAt(I) as Actor
    If currAct.IsDisabled()
      currAct.Enable(False)
    EndIf
    If currAct.IsDead()
      currAct.Reset(None)
    EndIf
    I += 1
  EndWhile
  Alias_SpaceportGuards.RemoveAll()
EndFunction

Function Fragment_Stage_1020_Item_00()
  UC09_PostQuest_VaeVictis_Misc.SetStage(1000)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Alias_Pacifist.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetStage(1100)
EndFunction
