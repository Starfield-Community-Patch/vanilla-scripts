ScriptName Fragments:Quests:QF_UC08_QueenBattle_0003E832 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_ThrallWaveOne Auto Const mandatory
RefCollectionAlias Property Alias_ThrallWaveTwo Auto Const mandatory
Scene Property UC08_QueenBattle_Percival_SignalIntro Auto Const mandatory
Scene Property UC08_QueenBattle_Percival_EnemiesInbound Auto Const mandatory
Quest Property UC08 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Queen Auto Const mandatory
Scene Property UC08_QueenBattle_Hadrian_WrapUp Auto Const mandatory
RefCollectionAlias Property Alias_TowerAmbushes Auto Const mandatory
ReferenceAlias Property Alias_ActiveSignalMarker Auto Const mandatory
ReferenceAlias Property Alias_SignalMarkerStrong Auto Const mandatory
ReferenceAlias Property Alias_WaveOneAmbushTrigger Auto Const mandatory
Scene Property UC08_QueenBattle_PercivalHad_SecondSwitch Auto Const mandatory
Scene Property UC08_QueenBattle_PercivalHad_FirstSwitch Auto Const mandatory
Scene Property UC08_QueenBattle_PercivalHad_ThirdSwitch Auto Const mandatory
RefCollectionAlias Property Alias_AcelesPlantThralls Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0095_Item_00()
  Quest __temp = Self as Quest
  uc08_queenbattle_questscript kmyQuest = __temp as uc08_queenbattle_questscript
  ObjectReference StrongREF = Alias_SignalMarkerStrong.GetRef()
  Alias_ActiveSignalMarker.ForceRefTo(StrongREF)
  StrongREF.Enable(False)
  kmyQuest.CleanUpPlantThralls()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  uc08_queenbattle_questscript kmyQuest = __temp as uc08_queenbattle_questscript
  defaultrefambushtrigger2 WaveOneRef = Alias_WaveOneAmbushTrigger.GetRef() as defaultrefambushtrigger2
  WaveOneRef.Enable(False)
  Alias_ThrallWaveOne.EnableAll(False)
  WaveOneRef.TriggerAmbush()
  Alias_TowerAmbushes.EnableAll(False)
  kmyQuest.StartSignalIntroTimer()
EndFunction

Function Fragment_Stage_0155_Item_00()
  If !Self.GetStageDone(900)
    UC08_QueenBattle_Percival_SignalIntro.Start()
  EndIf
EndFunction

Function Fragment_Stage_0160_Item_00()
  If !Self.GetStageDone(900)
    UC08.SetStage(526)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  (Alias_ThrallWaveTwo as uc08_ab_hostilethrallcollscript).TriggerWave()
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest
  uc08_queenbattle_questscript kmyQuest = __temp as uc08_queenbattle_questscript
  Alias_ActiveSignalMarker.GetRef().Disable(False)
  kmyQuest.RemoveMindControlSpell()
  UC08_QueenBattle_Percival_SignalIntro.Stop()
  UC08_QueenBattle_PercivalHad_FirstSwitch.Stop()
  UC08_QueenBattle_PercivalHad_SecondSwitch.Stop()
  UC08_QueenBattle_PercivalHad_ThirdSwitch.Stop()
  If !Self.GetStageDone(531)
    UC08_QueenBattle_Hadrian_WrapUp.Start()
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
