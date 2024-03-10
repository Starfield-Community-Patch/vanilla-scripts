ScriptName Fragments:Quests:QF_UCR01_001EBDD5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DebugTarget Auto Const mandatory
GlobalVariable Property UC09_PlayerChoiceResult Auto Const mandatory
GlobalVariable Property UCR01_TimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_MarineOfficer Auto Const mandatory
ReferenceAlias Property Alias_Marine Auto Const mandatory
ReferenceAlias Property Alias_Aceles Auto Const mandatory
ReferenceAlias Property Alias_TerrorMorph Auto Const mandatory
ReferenceAlias Property Alias_TerrorMorphSuperBug Auto Const mandatory
Quest Property UC09 Auto Const mandatory
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
Faction Property UCR01_AcelesTeamEnemy Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphEssential Auto Const mandatory
Quest Property DialogueUCFaction Auto Const mandatory
Topic Property UCR01_MarineOfficer_QuestComplete_Losses Auto Const mandatory
Topic Property UCR01_MarineOfficer_QuestComplete_NoLosses Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphFriendFaction Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
ActorValue Property UCR01_QuestComplete Auto Const mandatory
GlobalVariable Property UCR01_AcelesChance Auto Const mandatory
GlobalVariable Property UCR01_ExtraMorphChance Auto Const mandatory
ReferenceAlias Property Alias_ExtraMorph Auto Const mandatory
RefCollectionAlias Property Alias_AllMorphs Auto Const mandatory
RefCollectionAlias Property Alias_TerrormorphFriendCollection Auto Const mandatory
ActorValue Property DMP_ReleaseHoldPosition Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(Alias_DebugTarget.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Utility.RandomFloat(0.0, 100.0) <= UCR01_ExtraMorphChance.GetValue()
    Actor ExREF = Alias_ExtraMorph.GetActorRef()
    ExREF.SetValue(DMP_ReleaseHoldPosition, 1.0)
    Alias_AllMorphs.AddRef(ExREF as ObjectReference)
    Alias_TerrormorphFriendCollection.AddRef(ExREF as ObjectReference)
    ExREF.Enable(False)
    Self.SetStage(105)
  EndIf
  If UC09_PlayerChoiceResult.GetValue() == 1.0 && UCR01_TimesCompleted.GetValue() >= 1.0 && Utility.RandomFloat(0.0, 100.0) <= UCR01_AcelesChance.GetValue()
    Self.SetStage(110)
  EndIf
  Actor SuperREF = Alias_TerrorMorphSuperBug.GetActorRef()
  Alias_TerrormorphFriendCollection.AddRef(SuperREF as ObjectReference)
  Alias_AllMorphs.AddRef(SuperREF as ObjectReference)
  SuperREF.SetValue(DMP_ReleaseHoldPosition, 1.0)
  SuperREF.Enable(False)
  Self.SetObjectiveDisplayed(100, True, False)
  If !DialogueUCFaction.GetStageDone(550)
    DialogueUCFaction.SetStage(550)
  EndIf
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Aceles.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_TerrormorphFriendCollection.RemoveAll()
  If Self.GetStageDone(110)
    Alias_AllMorphs.AddToFaction(UCR01_AcelesTeamEnemy)
  EndIf
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_TerrormorphFriendCollection.RemoveAll()
  If Self.GetStageDone(110)
    Alias_AllMorphs.AddToFaction(UCR01_AcelesTeamEnemy)
  EndIf
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True)
  Self.SetObjectiveDisplayed(110, True, False)
  Alias_TerrorMorph.GetActorRef().AddToFaction(UCR01_AcelesTeamEnemy)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor ACRef = Alias_Aceles.GetActorRef()
  ACRef.IgnoreFriendlyHits(True)
  ACRef.EvaluatePackage(False)
  Self.SetStage(125)
  Alias_TerrorMorph.GetActorRef().AddToFaction(UCR01_AcelesTeamEnemy)
EndFunction

Function Fragment_Stage_1000_Item_00()
  UCR01_TimesCompleted.SetValue(UCR01_TimesCompleted.GetValue() + 1.0)
  Self.CompleteAllObjectives()
  Actor MarineOffACT = Alias_MarineOfficer.GetActorRef()
  If !MarineOffACT.IsDisabled()
    Actor TMRef = Alias_TerrorMorph.GetActorRef()
    TMRef.SetValue(UCR01_QuestComplete, 1.0)
    TMRef.EvaluatePackage(False)
    Utility.Wait(2.0)
    Alias_MarineOfficer.GetActorRef().StopCombatAlarm()
    Alias_Marine.GetActorRef().StopCombatAlarm()
    Alias_Aceles.GetActorRef().StopCombatAlarm()
    If Self.GetStageDone(175)
      MarineOffACT.Say(UCR01_MarineOfficer_QuestComplete_Losses, None, False, None)
    Else
      MarineOffACT.Say(UCR01_MarineOfficer_QuestComplete_NoLosses, None, False, None)
    EndIf
  EndIf
  Self.Stop()
  Self.Reset()
EndFunction
