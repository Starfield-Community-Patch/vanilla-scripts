ScriptName Fragments:Quests:QF_BE_KT04_000251D0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property SE_KT03 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate01 Auto Const mandatory
GlobalVariable Property BE_KT04_AudioSlateSeries Auto Const mandatory
RefCollectionAlias Property Alias_GenericCorpses Auto Const mandatory
Book Property BE_KT04_AudioLogSlate02 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate03 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate04 Auto Const mandatory
Book Property BE_KT04_DataSlate01 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate04B Auto Const mandatory
Book Property BE_KT04_DataSlate02 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant01 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant02 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant03 Auto Const mandatory
GlobalVariable Property BE_KT04_Variant04 Auto Const
Book Property BE_KT04_AudioLogSlate08 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate07 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate06 Auto Const mandatory
Book Property BE_KT04_DataSlate03 Auto Const mandatory
Book Property BE_KT04_DataSlate04 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate09 Auto Const mandatory
ActorBase Property LvlSpacer Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_Container Auto Const mandatory
Book Property BE_KT04_DataSlate00 Auto Const mandatory
ReferenceAlias Property Alias_SpacerCaptain Auto Const mandatory
Book Property BE_KT04_DataSlate03b Auto Const mandatory
ReferenceAlias Property Alias_AudioLog01 Auto Const mandatory
ReferenceAlias Property Alias_AudioLog02 Auto Const mandatory
ReferenceAlias Property Alias_AudioLog03 Auto Const mandatory
ReferenceAlias Property Alias_AudioLog04 Auto Const mandatory
RefCollectionAlias Property Alias_SlateCollection Auto Const mandatory
Quest Property SE_KT04 Auto Const mandatory
Book Property BE_KT04_AudioLogSlate08b Auto Const mandatory
RefCollectionAlias Property Alias_ItemSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
ReferenceAlias Property Alias_SpawnMarkerCaptain Auto Const mandatory
RefCollectionAlias Property Alias_Spacers Auto Const mandatory
VoiceType Property _NPC_NoLines Auto Const mandatory
RefCollectionAlias Property Alias_SmallItemSpawnMarkers Auto Const mandatory
Keyword Property LocTypeBEDerelict Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_Container.GetRef().AddAliasedItem(BE_KT04_DataSlate00 as Form, Alias_AudioLog04 as Alias, 1, True)
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeBEDerelict)
  SE_KT04.SetStage(30)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_Captain.GetActorRef().Kill(None)
EndFunction

Function Fragment_Stage_0015_Item_01()
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()
  ObjectReference[] pSpawnMarkers = Alias_SmallItemSpawnMarkers.GetArray()
  Alias_Captain.GetRef().AddAliasedItem(BE_KT04_AudioLogSlate02 as Form, Alias_AudioLog01 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())
  pCorpses[1].AddAliasedItem(BE_KT04_DataSlate01 as Form, Alias_AudioLog02 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())
  ObjectReference SlateRef = pSpawnMarkers[0].PlaceAtMe(BE_KT04_AudioLogSlate01 as Form, 1, False, False, True, None, None, True)
  Alias_AudioLog03.ForceRefTo(SlateRef)
  Alias_SlateCollection.AddRef(SlateRef)
  BE_KT04_Variant01.SetValue(1.0)
EndFunction

Function Fragment_Stage_0015_Item_02()
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()
  pCorpses[1].AddAliasedItem(BE_KT04_AudioLogSlate03 as Form, Alias_AudioLog01 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())
  pCorpses[2].AddAliasedItem(BE_KT04_DataSlate02 as Form, Alias_AudioLog02 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())
  ObjectReference CaptainRef = Alias_Captain.GetRef()
  CaptainRef.AddAliasedItem(BE_KT04_AudioLogSlate04 as Form, Alias_AudioLog03 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef())
  CaptainRef.AddAliasedItem(BE_KT04_AudioLogSlate04B as Form, Alias_AudioLog04 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())
  BE_KT04_Variant02.SetValue(1.0)
EndFunction

Function Fragment_Stage_0015_Item_03()
  Alias_SpacerCaptain.GetRef().AddAliasedItem(BE_KT04_AudioLogSlate07 as Form, Alias_AudioLog01 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())
  Int I = 0
  ObjectReference[] SpawnMarkers = Alias_CrewSpawnMarkers.GetArray()
  While I < SpawnMarkers.Length && I < 7
    ObjectReference Spacer = SpawnMarkers[I].PlaceAtMe(LvlSpacer as Form, 1, False, False, True, None, None, True)
    Alias_Spacers.AddRef(Spacer)
    I += 1
  EndWhile
  ObjectReference[] SpacerRefs = Alias_Spacers.GetArray()
  ObjectReference[] GenericCorpsesRefs = Alias_GenericCorpses.GetArray()
  SpacerRefs[0].AddAliasedItem(BE_KT04_AudioLogSlate06 as Form, Alias_AudioLog02 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())
  SpacerRefs[1].AddAliasedItem(BE_KT04_DataSlate03 as Form, Alias_AudioLog03 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef())
  Alias_Spacers.KillAll(None)
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()
  Alias_Captain.GetRef().AddAliasedItem(BE_KT04_DataSlate03b as Form, Alias_AudioLog04 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())
  BE_KT04_Variant03.SetValue(1.0)
EndFunction

Function Fragment_Stage_0015_Item_04()
  ObjectReference[] pSpawnMarkers = Alias_SmallItemSpawnMarkers.GetArray()
  ObjectReference[] pCorpses = Alias_GenericCorpses.GetArray()
  pCorpses[1].AddAliasedItem(BE_KT04_AudioLogSlate08 as Form, Alias_AudioLog01 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())
  ObjectReference SlateRef = pSpawnMarkers[0].PlaceAtMe(BE_KT04_AudioLogSlate08b as Form, 1, False, False, True, None, None, True)
  Alias_AudioLog02.ForceRefTo(SlateRef)
  Alias_SlateCollection.AddRef(SlateRef)
  ObjectReference Slate2Ref = pSpawnMarkers[1].PlaceAtMe(BE_KT04_AudioLogSlate09 as Form, 1, False, False, True, None, None, True)
  Alias_AudioLog03.ForceRefTo(Slate2Ref)
  Alias_SlateCollection.AddRef(Slate2Ref)
  Alias_Captain.GetRef().AddAliasedItem(BE_KT04_DataSlate04 as Form, Alias_AudioLog04 as Alias, 1, True)
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())
  BE_KT04_Variant04.SetValue(1.0)
EndFunction

Function Fragment_Stage_0015_Item_05()
  Alias_SpacerCaptain.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0015_Item_06()
  SE_KT04.SetStage(30)
  Self.SetObjectiveDisplayed(10, True, False)
  Alias_SlateCollection.AddRef(Alias_AudioLog01.GetRef())
  Alias_SlateCollection.AddRef(Alias_AudioLog02.GetRef())
  Alias_SlateCollection.AddRef(Alias_AudioLog03.GetRef())
  Alias_SlateCollection.AddRef(Alias_AudioLog04.GetRef())
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_Captain.GetActorRef().Kill(None)
EndFunction

Function Fragment_Stage_1000_Item_00()
  BE_KT04_AudioSlateSeries.SetValue(9.0)
EndFunction

Function Fragment_Stage_1000_Item_01()
  Self.SetObjectiveFailed(10, True)
  Self.Stop()
EndFunction
