ScriptName Fragments:Quests:QF_FFNeonZ03_000A935F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Styx Auto Const mandatory
objectmod Property bot_ModelA_Styx_Graffiti_01 Auto Const mandatory
objectmod Property bot_ModelA_Civ_01 Auto Const mandatory
Quest Property FFNeonZ03_SpeechChallengeQuest Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Warlord Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Credits Auto Const mandatory
ReferenceAlias Property Alias_Disciple Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Scene Property FFNeonZ03_Scene Auto Const mandatory
Quest Property FFNeonGuardPointer_Z03 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_FCNeonStyxClean Auto Const mandatory
ReferenceAlias Property Alias_StyxPost Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  FFNeonZ03_Scene.Start()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
  Self.SetObjectiveDisplayed(20, True, False)
  FFNeonZ03_SpeechChallengeQuest.Start()
  Alias_Warlord.GetRef().EnableNoWait(False)
  Actor DiscipleRef = Alias_Disciple.GetActorRef()
  DiscipleRef.EnableNoWait(False)
  DiscipleRef.SetValue(Aggression, 0.0)
  FFNeonGuardPointer_Z03.SetStage(200)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
  Self.SetObjectiveDisplayed(30, True, False)
  Game.GetPlayer().AddItem(Alias_Credits.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveSkipped(10)
  Self.SetObjectiveSkipped(20)
EndFunction

Function Fragment_Stage_0030_Item_01()
  Self.SetObjectiveCompleted(25, True)
  Self.SetObjectiveDisplayed(30, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor WarlordRef = Alias_Warlord.GetActorRef()
  Actor DiscipleRef = Alias_Disciple.GetActorRef()
  WarlordRef.SetValue(Aggression, 1.0)
  DiscipleRef.SetValue(Aggression, 1.0)
  WarlordRef.AddtoFaction(PlayerEnemyFaction)
  WarlordRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
  DiscipleRef.AddtoFaction(PlayerEnemyFaction)
  DiscipleRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(20, True)
  Self.SetObjectiveDisplayed(25, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().RemoveItem(Alias_Credits.GetRef() as Form, 1, False, None)
  FFNeonZ03_SpeechChallengeQuest.Stop()
  Alias_Warlord.GetRef().DisableNoWait(False)
  Alias_Disciple.GetRef().DisableNoWait(False)
  FFNeonZ03_SpeechChallengeQuest.Stop()
EndFunction

Function Fragment_Stage_0200_Item_00()
  ObjectReference StyxRef = Alias_Styx.GetRef()
  Alias_Styx.GetRef().DisableNoWait(False)
  Alias_FCNeonStyxClean.ForceRefTo(Alias_StyxPost.GetRef())
  DialogueFCNeon.SetStage(200)
  Self.Stop()
EndFunction
