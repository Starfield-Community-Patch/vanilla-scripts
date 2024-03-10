ScriptName Fragments:Quests:QF_BE_CF02_Ragana_BoardingQu_0010CB89 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Rake Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
Faction Property CF02_RaganaFaction Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_CaptainSpawnMarker Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
ObjectReference Property CF_AustinRakeRef Auto Const
LeveledItem Property LL_Weapon_Ranged_Handgun Auto Const mandatory
Faction Property CF02_RaganaHostileFaction Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Quest Property CF02_Ragana_SpeechChallenge04 Auto Const mandatory
ReferenceAlias Property Alias_CF02_Winston Auto Const mandatory
ReferenceAlias Property Alias_ModuleExit Auto Const mandatory
Scene Property BE_CF02_Ragana_BoardingQuestMovePlacement Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Scene Property BE_CF02_Ragana_Winston_Dialogue Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn01 Auto Const mandatory
ReferenceAlias Property Alias_GenericCrew02 Auto Const mandatory
ReferenceAlias Property Alias_GenericCrew03 Auto Const mandatory
ReferenceAlias Property Alias_GenericCrew04 Auto Const mandatory
ReferenceAlias Property Alias_AustinRakeName Auto Const mandatory
ReferenceAlias Property DmitriNPC01 Auto Const mandatory
ReferenceAlias Property DmitriNPC02 Auto Const mandatory
ReferenceAlias Property DmitriNPC03 Auto Const mandatory
affinityevent Property BE_CF02_Ragana_Winston_Dialogue_Action04_Choice01 Auto Const mandatory
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn02 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn03 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn04 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture01 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture02 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture03 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture04 Auto Const mandatory
Keyword Property LinkCustom09 Auto Const mandatory
Keyword Property LinkCustom10 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  BE_CF02_Ragana_BoardingQuestMovePlacement.Stop()
  Alias_GenericCrew04.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  BE_CF02_Ragana_Winston_Dialogue.Start()
EndFunction

Function Fragment_Stage_0004_Item_00()
  BE_CF02_Ragana_Winston_Dialogue_Action04_Choice01.Send(None)
EndFunction

Function Fragment_Stage_0005_Item_00()
  CF02.SetObjectiveCompleted(550, True)
  CF02.SetObjectiveDisplayed(560, True, False)
  ObjectReference CaptainRef = Alias_Captain.GetRef()
  Alias_CF02_Winston.ForceRefTo(CaptainRef)
  Alias_Rake.ForceRefTo(CF_AustinRakeRef)
  Alias_AustinRakeName.ForceRefTo(CF_AustinRakeRef)
  CF_AustinRakeRef.MoveTo(Alias_CrewSpawn01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_AllCrew.AddRef(CF_AustinRakeRef)
  ObjectReference[] myCrew = Alias_AllCrew.GetArray()
  myCrew[1].AddItem(LL_Weapon_Ranged_Handgun as Form, 1, False)
  myCrew[2].AddItem(LL_Weapon_Ranged_Handgun as Form, 1, False)
  BE_CF02_Ragana_BoardingQuestMovePlacement.Start()
  Self.SetStage(9)
  ObjectReference Link01 = Alias_CrewSpawn01.GetRef().GetLinkedRef(LinkCustom09)
  ObjectReference Link02 = Alias_CrewSpawn02.GetRef().GetLinkedRef(LinkCustom09)
  ObjectReference Link03 = Alias_CrewSpawn03.GetRef().GetLinkedRef(LinkCustom09)
  ObjectReference Link04 = Alias_CrewSpawn04.GetRef().GetLinkedRef(LinkCustom09)
  Alias_CrewSpawnFurniture01.ForceRefTo(Link01)
  Alias_CrewSpawnFurniture02.ForceRefTo(Link02)
  Alias_CrewSpawnFurniture03.ForceRefTo(Link03)
  Alias_CrewSpawnFurniture04.ForceRefTo(Link04)
EndFunction

Function Fragment_Stage_0007_Item_00()
  If Self.GetStageDone(8) && !Self.GetStageDone(40)
    Self.SetStage(30)
  Else
    Self.SetStage(20)
  EndIf
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_AustinRakeName.Clear()
EndFunction

Function Fragment_Stage_0009_Item_00()
  ObjectReference CaptainRef = Alias_Captain.GetRef()
  DmitriNPC01.ForceRefTo(CaptainRef)
  DmitriNPC02.ForceRefTo(CaptainRef)
  DmitriNPC03.ForceRefTo(CaptainRef)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_GenericCrew.AddRef(Alias_GenericCrew02.GetRef())
  Alias_GenericCrew.AddRef(Alias_GenericCrew03.GetRef())
  Alias_GenericCrew.AddRef(Alias_GenericCrew04.GetRef())
  Alias_GenericCrew.EnableAll(False)
EndFunction

Function Fragment_Stage_0015_Item_00()
  CF02.SetObjectiveCompleted(560, True)
  CF02_Ragana_SpeechChallenge04.Start()
EndFunction

Function Fragment_Stage_0020_Item_00()
  CF02.SetObjectiveFailed(560, True)
  CF02.SetObjectiveSkipped(600)
  CF02.SetObjectiveSkipped(605)
  CF02.SetObjectiveDisplayed(606, True, False)
  ObjectReference CaptainRef = Alias_Captain.GetRef()
  Alias_AllCrew.AddRef(CaptainRef)
  Actor PlayerRef = Game.GetPlayer()
  Alias_AllCrew.RemoveFromFaction(PlayerFriendFaction)
  PlayerRef.RemoveFromFaction(CF02_RaganaFaction)
  Alias_Rake.GetActorRef().StartCombat(PlayerRef as ObjectReference, False)
  Utility.Wait(0.5)
  Alias_AllCrew.SetValue(Aggression, 2.0)
  Alias_AllCrew.StartCombatAll(PlayerRef as ObjectReference)
  Alias_ModuleExit.GetRef().Lock(True, False, True)
  spaceshipreference RaganaRef = Alias_enemyShip.GetShipRef()
  RaganaRef.AddToFaction(PlayerEnemyFaction)
  RaganaRef.SetValue(Aggression, 1.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  CF02.SetObjectiveCompleted(600, True)
  CF02.SetObjectiveSkipped(605)
  Actor RakeRef = Alias_Rake.GetActorRef()
  RakeRef.RemoveFromFaction(CF02_RaganaFaction)
  Alias_AllCrew.RemoveRef(RakeRef as ObjectReference)
  RakeRef.SetValue(Aggression, 3.0)
  RakeRef.StartCombat(Alias_Captain.GetActorRef() as ObjectReference, False)
  RakeRef.AddToFaction(CF02_RaganaHostileFaction)
  Alias_GenericCrew.SetValue(Aggression, 1.0)
  Alias_GenericCrew.StartCombatAll(RakeRef as ObjectReference)
EndFunction

Function Fragment_Stage_0040_Item_00()
  CF02.SetObjectiveCompleted(605, True)
  BE_CF02_Ragana_Winston_Dialogue.Stop()
  Actor[] CrewRef = Alias_AllCrew.GetActorArray()
  Int I = 0
  While I < CrewRef.Length
    CrewRef[I].EvaluatePackage(False)
    Utility.Wait(0.75)
    I += 1
  EndWhile
  CF02.SetStage(475)
  CF02.SetStage(480)
  Self.SetStage(11)
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(60)
    CF02.SetStage(520)
  Else
    CF02.SetStage(610)
  EndIf
  CF02.SetObjectiveCompleted(606, True)
  Self.SetStage(11)
EndFunction

Function Fragment_Stage_0060_Item_00()
  If Self.GetStageDone(50)
    CF02.SetStage(520)
    Self.SetStage(1000)
  EndIf
  Alias_ModuleExit.GetRef().Lock(False, False, True)
  spaceshipreference ShipRef = Alias_enemyShip.GetShipRef()
  ShipRef.SetValue(SpaceshipCrew, 0.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_enemyShip.GetShipRef().SetValue(DockingPermission, 4.0)
EndFunction

Function Fragment_Stage_2000_Item_00()
  CF02.SetStage(12)
  Self.Stop()
EndFunction
