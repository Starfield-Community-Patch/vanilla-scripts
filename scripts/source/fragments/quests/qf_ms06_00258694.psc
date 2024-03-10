ScriptName Fragments:Quests:QF_MS06_00258694 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
Book Property MS06_ConstantSchematics Auto Const mandatory
ReferenceAlias Property Alias_Diana Auto Const mandatory
ReferenceAlias Property Alias_Bomani Auto Const mandatory
ReferenceAlias Property Alias_Mabhuti Auto Const mandatory
ReferenceAlias Property Alias_Colonist01 Auto Const mandatory
ReferenceAlias Property Alias_Colonist02 Auto Const mandatory
ReferenceAlias Property Alias_Colonist03 Auto Const mandatory
ReferenceAlias Property Alias_DianaInitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_BomaniInitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_MabhutiInitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_Colonist01InitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_Colonist02InitParadisoMarker Auto Const mandatory
ReferenceAlias Property Alias_Colonist03InitParadisoMarker Auto Const mandatory
Scene Property MS06_1610_FerryLandingScene Auto Const mandatory
Book Property MS06_GravDriveManual Auto Const mandatory
ReferenceAlias Property Alias_ConstantSchematics Auto Const mandatory
ReferenceAlias Property Alias_GravDriveManual Auto Const mandatory
Book Property MS06_ResourceList_Slate Auto Const mandatory
Quest Property MS06Intro Auto Const mandatory
RefCollectionAlias Property Alias_SecurityGuards Auto Const mandatory
RefCollectionAlias Property Alias_SecurityGuardsHostile Auto Const mandatory
ReferenceAlias Property Alias_Amin Auto Const mandatory
Topic Property MS06_2400_Amin_AllSetTopic Auto Const mandatory
ReferenceAlias Property Alias_Oliver Auto Const mandatory
GlobalVariable Property ECS_EndState Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantShip Auto Const mandatory
ReferenceAlias Property Alias_OrbitMapMarker Auto Const mandatory
ActorValue Property MS06_ECSForeknowledgeAV Auto Const mandatory
ActorValue Property MS06_EndForeknowledgeAV Auto Const mandatory
Message Property MS06_ECSConstantOrbitalNameMSG Auto Const mandatory
ReferenceAlias Property Alias_ECSConstantName Auto Const mandatory
Keyword Property MapMarkerLinkedRefNameOverride Auto Const mandatory
ReferenceAlias Property Alias_PorrimaIIOrbitName Auto Const mandatory
Quest Property DialogueParadiso Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const mandatory
Faction Property CrimeFactionECSConstant Auto Const mandatory
Faction Property GuardFaction Auto Const mandatory
ReferenceAlias Property Alias_StorageRoomCombatMarker Auto Const mandatory
RefCollectionAlias Property Alias_Lights Auto Const mandatory
ReferenceAlias Property Alias_KlaxonSoundMarker Auto Const mandatory
Quest Property DialogueECSConstantRoaming Auto Const mandatory
RefCollectionAlias Property Alias_Klaxons Auto Const mandatory
RefCollectionAlias Property Alias_Passengers Auto Const mandatory
Faction Property ECSConstantSecurityFaction Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
Faction Property ParadisoFaction Auto Const mandatory
LocationAlias Property Alias_ECSConstant Auto Const mandatory
ReferenceAlias Property Alias_PassengerFailsafeMarker Auto Const mandatory
ReferenceAlias[] Property PassengerArray Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100)
  Self.SetStage(200)
  Self.SetStage(300)
  Self.SetStage(400)
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(700)
  DialogueECSConstant.SetStage(1)
  DialogueECSConstant.SetStage(100)
  DialogueECSConstant.SetStage(110)
  MS06Intro.Stop()
  Game.GetPlayer().MoveTo(Alias_Oliver.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  kmyQuest.DebugGiveResources()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(1605)
  Alias_Diana.GetRef().MoveTo(Alias_DianaInitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Bomani.GetRef().MoveTo(Alias_BomaniInitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Mabhuti.GetRef().MoveTo(Alias_MabhutiInitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Colonist01.GetRef().MoveTo(Alias_Colonist01InitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Colonist02.GetRef().MoveTo(Alias_Colonist02InitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Colonist03.GetRef().MoveTo(Alias_Colonist03InitParadisoMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Utility.Wait(3.0)
  Self.SetStage(1610)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If DialogueECSConstant.GetStageDone(110)
    Self.SetStage(500)
  Else
    Self.SetObjectiveDisplayed(100, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0106_Item_00()
  Self.SetStage(101)
  Self.SetStage(102)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.IsObjectiveCompleted(100)
    Self.SetObjectiveCompleted(100, True)
  EndIf
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.IsObjectiveCompleted(100)
    Self.SetObjectiveCompleted(100, True)
  EndIf
  If !Self.IsObjectiveCompleted(200)
    Self.SetObjectiveDisplayed(200, False, False)
  EndIf
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(200, True)
  If Self.IsObjectiveDisplayed(300)
    Self.SetObjectiveCompleted(300, True)
  EndIf
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.IsObjectiveDisplayed(400)
    Self.SetObjectiveCompleted(400, True)
  EndIf
  Self.SetObjectiveDisplayed(500, True, False)
  Alias_ECSConstantShip.GetRef().SetOverrideName(None)
  Alias_OrbitMapMarker.GetRef().SetLinkedRef(Alias_ECSConstantName.GetRef(), MapMarkerLinkedRefNameOverride, True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0605_Item_00()
  Game.GetPlayer().SetValue(MS06_ECSForeknowledgeAV, 1.0)
  If Self.GetStageDone(200)
    Self.SetStage(700)
  Else
    Self.SetStage(650)
  EndIf
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True)
  If !Self.GetStageDone(700)
    Self.SetObjectiveDisplayed(650, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0690_Item_00()
  Self.SetObjectiveDisplayed(690, True, False)
EndFunction

Function Fragment_Stage_0691_Item_00()
  Self.SetObjectiveCompleted(690, True)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True)
  If Self.GetStageDone(650)
    Self.SetObjectiveCompleted(650, True)
  EndIf
  Self.SetObjectiveDisplayed(700, True, False)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().AddItem(MS06_ResourceList_Slate as Form, 1, False)
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(999, True, False)
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_OrbitMapMarker.GetRef().SetLinkedRef(Alias_PorrimaIIOrbitName.GetRef(), MapMarkerLinkedRefNameOverride, True)
  If Self.GetStageDone(1710) || Self.GetStageDone(2410)
    DialogueECSConstantRoaming.Start()
  EndIf
  MS06Intro.SetStage(1000)
  Game.GetPlayer().SetValue(MS06_EndForeknowledgeAV, 1.0)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  Self.SetObjectiveCompleted(999, True)
  Self.SetObjectiveDisplayed(1010, True, False)
  Self.SetObjectiveDisplayed(1020, True, False)
  Self.SetObjectiveDisplayed(1030, True, False)
  Self.SetObjectiveDisplayed(1040, True, False)
  kmyQuest.RegisterPlayerforInventoryFilter()
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveDisplayed(1050, True, False)
EndFunction

Function Fragment_Stage_1060_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  Self.SetObjectiveCompleted(1050, True)
  kmyQuest.ConstantGiveResources()
EndFunction

Function Fragment_Stage_1070_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  Self.SetObjectiveCompleted(1050, True)
  kmyQuest.ConstantGiveGoods()
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveCompleted(1010, True)
  Self.SetObjectiveCompleted(1020, True)
  Self.SetObjectiveCompleted(1030, True)
  Self.SetObjectiveCompleted(1040, True)
  Self.SetObjectiveDisplayed(1500, True, False)
EndFunction

Function Fragment_Stage_1600_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Self.SetObjectiveCompleted(1500, True)
  Self.SetObjectiveDisplayed(1600, True, False)
  DialogueECSConstant.SetStage(1600)
  kmyQuest.AddPassenger(Alias_Diana)
  kmyQuest.AddPassenger(Alias_Bomani)
  kmyQuest.AddPassenger(Alias_Mabhuti)
  kmyQuest.AddPassenger(Alias_Colonist01)
  kmyQuest.AddPassenger(Alias_Colonist02)
  kmyQuest.AddPassenger(Alias_Colonist03)
EndFunction

Function Fragment_Stage_1600_Item_01()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  kmyQuest.RemoveResources()
EndFunction

Function Fragment_Stage_1601_Item_00()
  Alias_Passengers.RemoveFromFaction(ECSConstantSecurityFaction)
  Alias_Passengers.RemoveFromFaction(CrimeFactionECSConstant)
  Alias_Passengers.AddToFaction(CrimeFactionParadiso)
  Alias_Passengers.AddToFaction(ParadisoFaction)
  Int I = 0
  Int iCount = Alias_Passengers.GetCount()
  While I < iCount
    Actor myPassenger = Alias_Passengers.GetAt(I) as Actor
    myPassenger.SetCrimeFaction(CrimeFactionParadiso)
    myPassenger.SetGhost(True)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1605_Item_00()
  Self.SetObjectiveCompleted(1600, True)
  Self.SetObjectiveDisplayed(1605, True, False)
  Int I = 0
  Int iCount = Alias_Passengers.GetCount()
  While I < iCount
    Actor myPassenger = Alias_Passengers.GetAt(I) as Actor
    myPassenger.SetGhost(False)
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1610_Item_00()
  MS06_1610_FerryLandingScene.Start()
EndFunction

Function Fragment_Stage_1700_Item_00()
  Self.SetObjectiveCompleted(1605, True)
  Self.SetObjectiveDisplayed(1700, True, False)
EndFunction

Function Fragment_Stage_1710_Item_00()
  Self.SetObjectiveCompleted(1700, True)
  If Self.IsObjectiveDisplayed(3100)
    Self.SetObjectiveCompleted(3100, True)
  EndIf
  ECS_EndState.SetValue(1.0)
  DialogueParadiso.SetStage(2000)
EndFunction

Function Fragment_Stage_1711_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(2000, True, False)
EndFunction

Function Fragment_Stage_2100_Item_00()
  Self.SetObjectiveCompleted(2000, True)
  Self.SetObjectiveDisplayed(2100, True, False)
EndFunction

Function Fragment_Stage_2111_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  kmyQuest.RemoveCredits(True)
EndFunction

Function Fragment_Stage_2121_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  kmyQuest.RemoveCredits(False)
EndFunction

Function Fragment_Stage_2200_Item_00()
  Self.SetObjectiveCompleted(2100, True)
  Self.SetObjectiveDisplayed(2200, True, False)
  Game.GetPlayer().AddItem(Alias_GravDriveManual.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_2300_Item_00()
  Self.SetObjectiveCompleted(2200, True)
  Self.SetObjectiveDisplayed(2300, True, False)
EndFunction

Function Fragment_Stage_2400_Item_00()
  Alias_Amin.GetRef().Say(MS06_2400_Amin_AllSetTopic, None, False, None)
  Self.SetObjectiveCompleted(2300, True)
  Self.SetObjectiveDisplayed(2400, True, False)
EndFunction

Function Fragment_Stage_2410_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Self.SetObjectiveCompleted(2400, True)
  If Self.IsObjectiveDisplayed(3100)
    Self.SetObjectiveCompleted(3100, True)
  EndIf
  ECS_EndState.SetValue(2.0)
  DialogueECSConstant.SetStage(2000)
EndFunction

Function Fragment_Stage_2411_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_3100_Item_00()
  Self.SetObjectiveDisplayed(3100, True, False)
EndFunction

Function Fragment_Stage_3150_Item_00()
  Self.SetObjectiveCompleted(3100, True)
  Self.SetObjectiveDisplayed(3150, True, False)
EndFunction

Function Fragment_Stage_3200_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  Self.SetObjectiveFailed(100, True)
  Self.SetObjectiveFailed(200, True)
  Self.SetObjectiveFailed(300, True)
  Self.SetObjectiveFailed(400, True)
  Self.SetObjectiveFailed(500, True)
  Self.SetObjectiveFailed(600, True)
  Self.SetObjectiveFailed(650, True)
  Self.SetObjectiveFailed(700, True)
  Self.SetObjectiveFailed(999, True)
  Self.SetObjectiveFailed(1010, True)
  Self.SetObjectiveFailed(1020, True)
  Self.SetObjectiveFailed(1030, True)
  Self.SetObjectiveFailed(1040, True)
  Self.SetObjectiveFailed(1050, True)
  Self.SetObjectiveFailed(1500, True)
  Self.SetObjectiveFailed(1600, True)
  Self.SetObjectiveFailed(1700, True)
  Self.SetObjectiveFailed(2000, True)
  Self.SetObjectiveFailed(2100, True)
  Self.SetObjectiveFailed(2200, True)
  Self.SetObjectiveFailed(2300, True)
  Self.SetObjectiveFailed(2400, True)
  Self.SetObjectiveCompleted(3150, True)
  Self.SetObjectiveDisplayed(3200, True, False)
  kmyQuest.SetECSConstantSelfDestruct()
  Alias_StorageRoomCombatMarker.GetRef().Enable(False)
  Alias_SecurityGuards.RemoveFromFaction(GuardFaction)
  Alias_SecurityGuardsHostile.AddRefCollection(Alias_SecurityGuards)
EndFunction

Function Fragment_Stage_3200_Item_01()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Int I = 0
  Int iCount = PassengerArray.Length
  Location myECSLocation = Alias_ECSConstant.GetLocation()
  While I < iCount
    Actor myPassenger = PassengerArray[I].GetActorRef()
    kmyQuest.RemovePassengerActor(myPassenger)
    ObjectReference myFailsafeMarker = Alias_PassengerFailsafeMarker.GetRef()
    If !myPassenger.IsInLocation(myECSLocation)
      myPassenger.MoveTo(myFailsafeMarker, 0.0, 0.0, 0.0, True, False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_3250_Item_00()
  Quest __temp = Self as Quest
  ms06_questscript kmyQuest = __temp as ms06_questscript
  kmyQuest.ECSConstantExplode()
EndFunction

Function Fragment_Stage_3300_Item_00()
  Self.SetObjectiveCompleted(3200, True)
  Self.SetObjectiveDisplayed(3300, True, False)
EndFunction

Function Fragment_Stage_3300_Item_01()
  Self.SetObjectiveCompleted(3200, True)
  Self.SetStage(3330)
EndFunction

Function Fragment_Stage_3310_Item_00()
  Self.SetObjectiveCompleted(3300, True)
  ECS_EndState.SetValue(3.0)
  PD_Hotel_RoomCost_Daily.SetValue(0.0)
  PD_Hotel_RoomCost_Weekly.SetValue(0.0)
EndFunction

Function Fragment_Stage_3311_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_3320_Item_00()
  Self.SetObjectiveCompleted(3300, True)
EndFunction

Function Fragment_Stage_3321_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_3330_Item_00()
  Self.FailAllObjectives()
EndFunction

Function Fragment_Stage_3331_Item_00()
  Self.Stop()
EndFunction
