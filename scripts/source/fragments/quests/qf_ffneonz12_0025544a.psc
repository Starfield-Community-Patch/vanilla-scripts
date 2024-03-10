ScriptName Fragments:Quests:QF_FFNeonZ12_0025544A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeon Auto Const mandatory
ReferenceAlias Property Alias_Miguel Auto Const mandatory
ActorBase Property FC_Neon_MiguelReeves Auto Const mandatory
Keyword Property AnimArchetypeConfident Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory
ReferenceAlias Property Alias_Booth Auto Const mandatory
ReferenceAlias Property Alias_MiguelEnhanced Auto Const mandatory
ReferenceAlias Property Miguel Auto Const mandatory
Scene Property FFNeonZ12_001_SceneOpener Auto Const mandatory
ReferenceAlias Property Alias_Booth02 Auto Const mandatory
ReferenceAlias Property Alias_Hapa Auto Const mandatory
ReferenceAlias Property Alias_Chair Auto Const mandatory
Scene Property FFNeonZ12_040_ScenePaige Auto Const mandatory
ReferenceAlias Property Alias_PaigeOverton Auto Const mandatory
Scene Property FFNeonZ12_060_ErikaScene01 Auto Const mandatory
Scene Property FFNeonZ12_060_ErikaScene03 Auto Const mandatory
ReferenceAlias Property Alias_Erika Auto Const mandatory
ReferenceAlias Property Alias_Sauvage Auto Const mandatory
Scene Property FFNeonZ12_070_MovePosition Auto Const mandatory
ReferenceAlias Property Alias_Booth03 Auto Const mandatory
ReferenceAlias Property Alias_LegrandeSpot Auto Const mandatory
Scene Property FFNeonZ12_005_SceneOpener Auto Const mandatory
ReferenceAlias Property Alias_Legrande Auto Const mandatory
Potion Property Food_RS_MSauvage_VelocityBlue Auto Const mandatory
Potion Property Food_RS_MSauvage_VelocityRed Auto Const mandatory
ReferenceAlias Property Alias_AstralCouch Auto Const mandatory
ReferenceAlias Property Alias_DancingMarker Auto Const mandatory
ReferenceAlias Property Alias_EnhanceMarker Auto Const mandatory
ReferenceAlias Property Alias_StartCouch Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Miguel.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0002_Item_00()
  FFNeonZ12_040_ScenePaige.Start()
EndFunction

Function Fragment_Stage_0003_Item_00()
  FFNeonZ12_060_ErikaScene01.Start()
EndFunction

Function Fragment_Stage_0004_Item_00()
  FFNeonZ12_070_MovePosition.Stop()
  FFNeonZ12_060_ErikaScene03.Start()
  Self.SetObjectiveCompleted(85, True)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor MiguelRef = Alias_Miguel.GetActorRef()
  MiguelRef.EnableNoWait(False)
  MiguelRef.SnapIntoInteraction(Alias_StartCouch.GetRef())
EndFunction

Function Fragment_Stage_0006_Item_00()
  FFNeonZ12_070_MovePosition.Start()
EndFunction

Function Fragment_Stage_0007_Item_00()
  Self.SetStage(20)
  Game.GetPlayer().MoveTo(Alias_Miguel.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(40)
  Game.GetPlayer().MoveTo(Alias_Miguel.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetStage(50)
  Game.GetPlayer().MoveTo(Alias_PaigeOverton.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Self.SetStage(70)
  Game.GetPlayer().MoveTo(Alias_MiguelEnhanced.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Alias_Miguel.GetRef().MoveTo(Alias_Legrande.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0015_Item_00()
  FFNeonZ12_001_SceneOpener.Start()
EndFunction

Function Fragment_Stage_0017_Item_00()
  FFNeonZ12_005_SceneOpener.Start()
EndFunction

Function Fragment_Stage_0018_Item_00()
  Game.GetPlayer().RemoveItem(Food_RS_MSauvage_VelocityRed as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Actor MiguelRef = Alias_Miguel.GetActorRef()
  DialogueFCNeon.SetStage(583)
  MiguelRef.RemoveKeyword(AnimArchetypeDepressed)
  MiguelRef.AddKeyword(AnimArchetypeConfident)
  MiguelRef.MoveTo(Alias_Booth02.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Hapa.GetRef().MoveTo(Alias_Booth02.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0021_Item_00()
  Self.SetStage(13)
  Game.GetPlayer().MoveTo(Alias_Legrande.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_Miguel.GetRef().MoveTo(Alias_DancingMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Hapa.GetRef().MoveTo(Alias_AstralCouch.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference MiguelEnhanced = Alias_MiguelEnhanced.GetRef()
  Alias_Miguel.GetRef().DisableNoWait(False)
  MiguelEnhanced.EnableNoWait(False)
  MiguelEnhanced.MoveTo(Alias_EnhanceMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Alias_MiguelEnhanced.GetRef().MoveTo(Alias_Chair.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveDisplayed(80, True, False)
  ObjectReference ErikaRef = Alias_Erika.GetRef()
  ErikaRef.EnableNoWait(False)
  ErikaRef.MoveTo(Alias_Booth03.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Self.SetObjectiveDisplayed(90, True, False)
  Miguel.ForceRefTo(Alias_MiguelEnhanced.GetRef())
  Alias_Erika.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetObjectiveCompleted(90, True)
  Self.Stop()
EndFunction

Function Fragment_Stage_0098_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_0099_Item_00()
  Self.SetObjectiveDisplayed(99, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(80, True)
  Alias_Erika.GetActorRef().EvaluatePackage(False)
  Self.SetObjectiveDisplayed(85, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor MiguelRef = Alias_Miguel.GetActorRef()
  Alias_MiguelEnhanced.GetRef().DisableNoWait(False)
  MiguelRef.EnableNoWait(False)
  MiguelRef.RemoveKeyword(AnimArchetypeDepressed)
  MiguelRef.AddKeyword(AnimArchetypeConfident)
  Self.Stop()
EndFunction
