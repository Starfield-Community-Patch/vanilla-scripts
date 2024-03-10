ScriptName Fragments:Quests:QF_MS02_0029A00C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS02_CluesCollected Auto Const mandatory
Scene Property MS02_1550_WarningMessage Auto Const mandatory
Scene Property MS02_0100_EmergencyBroadcast Auto Const mandatory
ReferenceAlias Property Alias_AdaLovelace Auto Const mandatory
ReferenceAlias Property Alias_GenghisKhan Auto Const mandatory
ReferenceAlias Property Alias_Amanirenas Auto Const mandatory
ReferenceAlias Property Alias_FDR Auto Const mandatory
ReferenceAlias Property Alias_CrucibleCOC Auto Const mandatory
ReferenceAlias Property Alias_AdaTempName Auto Const
ReferenceAlias Property Alias_FDRTempName Auto Const
Quest Property MS02_Delivery Auto Const mandatory
Scene Property MS02_1090_OriginDoorWarning Auto Const mandatory
RefCollectionAlias Property Alias_Renegades Auto Const mandatory
Faction Property MS02_BelieversFaction Auto Const mandatory
Faction Property MS02_PragmatistsFaction Auto Const mandatory
Faction Property MS02_RenegadesFaction Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property MS02_1900_PC_Kills_Crucible Auto Const mandatory
ReferenceAlias Property Alias_AlienSpawner Auto Const mandatory
RefCollectionAlias Property Alias_GenghisAliens Auto Const mandatory
RefCollectionAlias Property Alias_InitiallyHiddenPeople Auto Const mandatory
GlobalVariable Property Crew_Elite_CanHireAmelia Auto Const mandatory
Quest Property AmeliaEliteCrewQuest Auto Const
ReferenceAlias Property Alias_FacilityMapMarker Auto Const mandatory
Scene Property MS02_0610_GenghisApproaches Auto Const mandatory
ReferenceAlias Property Alias_Beacon01_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_FacilityRestrictedTerminal Auto Const mandatory
MiscObject Property MS02_EncryptedSecurityOverrideCode Auto Const mandatory
ReferenceAlias Property Alias_EncryptedOverrideCode Auto Const mandatory
ReferenceAlias Property Alias_OverrideCode Auto Const mandatory
MiscObject Property MS02_SecurityOverrideCode Auto Const mandatory
ActorValue Property MS02_Foreknowledge Auto Const mandatory
ReferenceAlias Property Alias_DoorPragmatists Auto Const mandatory
RefCollectionAlias Property Alias_DoorsCrucible Auto Const mandatory
Faction Property CrimeFactionCrucible Auto Const mandatory
Faction Property CrucibleFaction Auto Const mandatory
RefCollectionAlias Property Alias_Believers Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
RefCollectionAlias Property Alias_Pragmatists Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
ReferenceAlias Property Alias_BeagleMapMarker Auto Const mandatory
ActorValue Property MS02_LeaderReadyToFight Auto Const mandatory
Message Property MS02_BeagleNavBeaconMessage Auto Const mandatory
ReferenceAlias Property Alias_BackdoorFacility Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Quest Property Crucible01 Auto Const mandatory
ReferenceAlias Property Alias_Beagle Auto Const mandatory
GlobalVariable Property SE_Player_FAB18a_Timestamp Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
RefCollectionAlias Property Alias_NeutralClones Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_CrucibleCOC.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100)
  Alias_InitiallyHiddenPeople.DisableAll(False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_CrucibleCOC.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(200)
  Self.SetStage(210)
  Self.SetStage(250)
  Self.SetStage(300)
  Self.SetStage(310)
  Self.SetStage(400)
  Self.SetStage(500)
  Self.SetStage(600)
  Self.SetStage(700)
  Self.SetStage(800)
  Self.SetStage(900)
  Self.SetStage(1000)
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(2)
  Self.SetStage(1200)
  Self.SetStage(1210)
  Self.SetStage(1300)
  Self.SetStage(1400)
  Self.SetStage(1500)
  Self.SetStage(1550)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(2)
  Self.SetStage(1200)
  Self.SetStage(1220)
  Self.SetStage(1300)
  Self.SetStage(1400)
  Self.SetStage(1500)
  Self.SetStage(1550)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetStage(2)
  Self.SetStage(1200)
  Self.SetStage(1230)
  Self.SetStage(1300)
  Self.SetStage(1400)
  Self.SetStage(1500)
  Self.SetStage(1550)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Utility.Wait(0.100000001)
  MS02_0100_EmergencyBroadcast.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_AdaLovelace.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0250_Item_00()
  MS02_Delivery.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(400, True, False)
  ObjectReference oTarg = Alias_DoorPragmatists.GetRef()
  oTarg.Lock(False, False, True)
  oTarg.SetOpen(True)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Alias_AdaTempName.Clear()
  Alias_FDRTempName.Clear()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  Self.SetObjectiveDisplayed(600, True, False)
  Alias_InitiallyHiddenPeople.EnableAll(False)
  Game.GetPlayer().SetValue(MS02_Foreknowledge, 1.0)
  Alias_DoorsCrucible.GetAt(0).Lock(False, False, True)
  Alias_DoorsCrucible.GetAt(1).Lock(False, False, True)
  Alias_DoorsCrucible.GetAt(2).Lock(False, False, True)
  Alias_DoorsCrucible.SetOpen(True)
  Alias_GenghisKhan.GetActorRef().AddToFaction(PlayerAllyFaction)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True)
  If Self.GetStageDone(600)
    Self.SetStage(800)
  EndIf
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(600, True)
  If Self.GetStageDone(500)
    Self.SetStage(800)
  EndIf
  Alias_GenghisKhan.GetActorRef().RemoveFromFaction(PlayerAllyFaction)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0610_Item_00()
  If !Self.GetStageDone(600)
    Alias_GenghisAliens.EnableAll(False)
    Alias_GenghisAliens.StartCombatAll(Alias_GenghisKhan.GetActorRef() as ObjectReference)
    Alias_GenghisKhan.GetActorRef().EvaluatePackage(False)
    MS02_0610_GenghisApproaches.Start()
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(700, True, False)
  Self.SetObjectiveCompleted(800, True)
  Alias_FacilityMapMarker.GetRef().Enable(False)
  Crucible01.Start()
EndFunction

Function Fragment_Stage_10000_Item_00()
  Crew_Elite_CanHireAmelia.SetValue(1.0)
  AmeliaEliteCrewQuest.SetStage(1)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(1000, True, False)
EndFunction

Function Fragment_Stage_1001_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.CountClues()
EndFunction

Function Fragment_Stage_1002_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.CountClues()
EndFunction

Function Fragment_Stage_1003_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.CountClues()
EndFunction

Function Fragment_Stage_1004_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.CountClues()
EndFunction

Function Fragment_Stage_1005_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.CountClues()
EndFunction

Function Fragment_Stage_1006_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.CountClues()
EndFunction

Function Fragment_Stage_1007_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.CountClues()
EndFunction

Function Fragment_Stage_1090_Item_00()
  MS02_1090_OriginDoorWarning.Start()
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveCompleted(1100, True)
  Self.SetObjectiveDisplayed(1200, True, False)
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  Self.SetObjectiveDisplayed(1300, True, False)
  Alias_Beagle.GetRef().Enable(False)
  Alias_Beacon01_MapMarker.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1310_Item_00()
  Self.SetObjectiveCompleted(1300, True)
  Self.SetObjectiveDisplayed(1310, True, False)
  Alias_BeagleMapMarker.GetRef().Enable(False)
  MS02_BeagleNavBeaconMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_1320_Item_00()
  Int I = 0
EndFunction

Function Fragment_Stage_1330_Item_00()
  Int I = 0
EndFunction

Function Fragment_Stage_1335_Item_00()
  Int I = 0
EndFunction

Function Fragment_Stage_1400_Item_00()
  Self.SetObjectiveCompleted(1300, True)
  Self.SetObjectiveCompleted(1310, True)
  Self.SetObjectiveDisplayed(1400, True, False)
EndFunction

Function Fragment_Stage_1500_Item_00()
  Self.SetObjectiveCompleted(1400, True)
  Self.SetObjectiveDisplayed(1880, True, False)
  Game.GetPlayer().AddAliasedItem(MS02_EncryptedSecurityOverrideCode as Form, Alias_EncryptedOverrideCode as Alias, 1, False)
EndFunction

Function Fragment_Stage_1550_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  MS02_1550_WarningMessage.Start()
  If Self.GetStageDone(1210)
    Self.SetStage(1600)
  ElseIf Self.GetStageDone(1220)
    Self.SetStage(1700)
  Else
    Self.SetStage(1800)
  EndIf
EndFunction

Function Fragment_Stage_1600_Item_00()
  Self.SetObjectiveDisplayed(1600, True, False)
EndFunction

Function Fragment_Stage_1610_Item_00()
  Self.SetObjectiveCompleted(1600, True)
  Self.SetObjectiveDisplayed(1610, True, False)
  ObjectReference oTarg = None
  ObjectReference oLinkedRef = None
  oTarg = Alias_Amanirenas.GetRef()
  oLinkedRef = oTarg.GetLinkedRef(None)
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_FDR.GetRef()
  (oTarg as Actor).EvaluatePackage(False)
  oTarg = Alias_GenghisKhan.GetRef()
  oLinkedRef = oTarg.GetLinkedRef(None)
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1615_Item_00()
  Actor aTarg = Alias_GenghisKhan.GetActorRef()
  Actor aTarg2 = Alias_Amanirenas.GetActorRef()
  aTarg.SetValue(MS02_LeaderReadyToFight, 1.0)
  aTarg.EvaluatePackage(False)
  If !Self.GetStageDone(1622)
    aTarg2.SetValue(MS02_LeaderReadyToFight, 1.0)
    aTarg2.EvaluatePackage(False)
  EndIf
  Utility.Wait(1.0)
  aTarg.MoveToPackageLocation()
  If !Self.GetStageDone(1622)
    aTarg2.MoveToPackageLocation()
  EndIf
EndFunction

Function Fragment_Stage_1620_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  Self.SetObjectiveCompleted(1610, True)
  Self.SetObjectiveDisplayed(1620, True, False)
  kmyQuest.RemoveFactions()
  If !Self.GetStageDone(1622)
    Self.SetObjectiveDisplayed(1625, True, False)
  EndIf
  Actor aTarg = Alias_GenghisKhan.GetActorRef()
  kmyQuest.GoHostile(aTarg)
  If !Self.GetStageDone(1622)
    aTarg = Alias_Amanirenas.GetActorRef()
    kmyQuest.GoHostile(aTarg)
    MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, False, False)
    Alias_Believers.AddToFaction(PlayerEnemyFaction)
  EndIf
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, False, False)
  Alias_Renegades.AddToFaction(PlayerEnemyFaction)
EndFunction

Function Fragment_Stage_1621_Item_00()
  Self.SetStage(1622)
EndFunction

Function Fragment_Stage_1625_Item_00()
  Self.SetStage(1622)
EndFunction

Function Fragment_Stage_1630_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  Self.SetObjectiveCompleted(1620, True)
  Self.SetObjectiveDisplayed(1630, True, False)
  Self.SetStage(1870)
EndFunction

Function Fragment_Stage_1632_Item_00()
  If Self.GetStageDone(1622) || Self.GetStageDone(1634)
    Self.SetStage(1630)
  EndIf
  Alias_Renegades.RemoveFromFaction(PlayerEnemyFaction)
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, True, True)
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, True, True)
  Alias_Renegades.StopCombat()
  Alias_Renegades.EvaluateAll()
  Self.SetObjectiveCompleted(1620, True)
EndFunction

Function Fragment_Stage_1634_Item_00()
  If Self.GetStageDone(1632)
    Self.SetStage(1630)
  EndIf
  Alias_Believers.RemoveFromFaction(PlayerEnemyFaction)
  MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, True, True)
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, True, True)
  Alias_Believers.StopCombat()
  Alias_Believers.EvaluateAll()
  Self.SetObjectiveCompleted(1625, True)
EndFunction

Function Fragment_Stage_1640_Item_00()
  Self.SetObjectiveCompleted(1630, True)
  Self.SetStage(1875)
EndFunction

Function Fragment_Stage_1700_Item_00()
  Self.SetObjectiveDisplayed(1601, True, False)
EndFunction

Function Fragment_Stage_1710_Item_00()
  Self.SetObjectiveCompleted(1601, True)
  Self.SetObjectiveDisplayed(1610, True, False)
  ObjectReference oTarg = None
  ObjectReference oLinkedRef = None
  oTarg = Alias_Amanirenas.GetRef()
  (oTarg as Actor).EvaluatePackage(False)
  oTarg = Alias_FDR.GetRef()
  oLinkedRef = oTarg.GetLinkedRef(None)
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_GenghisKhan.GetRef()
  oLinkedRef = oTarg.GetLinkedRef(None)
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1715_Item_00()
  Alias_GenghisKhan.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0)
EndFunction

Function Fragment_Stage_1720_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  Self.SetObjectiveCompleted(1610, True)
  Self.SetObjectiveDisplayed(1620, True, False)
  kmyQuest.RemoveFactions()
  Actor aTarg = Alias_GenghisKhan.GetActorRef()
  Actor aPlayer = Game.GetPlayer()
  kmyQuest.GoHostile(aTarg)
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, False, False)
EndFunction

Function Fragment_Stage_1730_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  Self.SetObjectiveCompleted(1620, True)
  Self.SetObjectiveDisplayed(1730, True, False)
  Self.SetStage(1870)
  Alias_Renegades.RemoveFromFaction(PlayerEnemyFaction)
  MS02_RenegadesFaction.SetEnemy(MS02_BelieversFaction, True, True)
  MS02_RenegadesFaction.SetEnemy(MS02_PragmatistsFaction, True, True)
EndFunction

Function Fragment_Stage_1740_Item_00()
  Self.SetObjectiveCompleted(1730, True)
  Self.SetStage(1875)
EndFunction

Function Fragment_Stage_1800_Item_00()
  Self.SetObjectiveDisplayed(1602, True, False)
EndFunction

Function Fragment_Stage_1810_Item_00()
  Self.SetObjectiveCompleted(1602, True)
  Self.SetObjectiveDisplayed(1610, True, False)
  ObjectReference oTarg = None
  ObjectReference oLinkedRef = None
  oTarg = Alias_Amanirenas.GetRef()
  oLinkedRef = oTarg.GetLinkedRef(None)
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_FDR.GetRef()
  oLinkedRef = oTarg.GetLinkedRef(None)
  oTarg.MoveTo(oLinkedRef, 0.0, 0.0, 0.0, True, False)
  oTarg = Alias_GenghisKhan.GetRef()
  (oTarg as Actor).EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1815_Item_00()
  Alias_Amanirenas.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0)
  If !Self.GetStageDone(1822)
    Alias_FDR.GetActorRef().SetValue(MS02_LeaderReadyToFight, 1.0)
  EndIf
EndFunction

Function Fragment_Stage_1820_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  Self.SetObjectiveCompleted(1610, True)
  Self.SetObjectiveDisplayed(1625, True, False)
  If !Self.GetStageDone(1822)
    Self.SetObjectiveDisplayed(1627, True, False)
  EndIf
  kmyQuest.RemoveFactions()
  Actor aPlayer = Game.GetPlayer()
  aPlayer.AddToFaction(MS02_RenegadesFaction)
  Actor aTarg = Alias_Amanirenas.GetActorRef()
  kmyQuest.GoHostile(aTarg)
  If !Self.GetStageDone(1822)
    aTarg = Alias_FDR.GetActorRef()
    kmyQuest.GoHostile(aTarg)
    MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, False, False)
  EndIf
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, False, False)
EndFunction

Function Fragment_Stage_1823_Item_00()
  Self.SetStage(1622)
EndFunction

Function Fragment_Stage_1830_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  Self.SetObjectiveDisplayed(1830, True, False)
  Self.SetStage(1870)
EndFunction

Function Fragment_Stage_1832_Item_00()
  If Self.GetStageDone(1822) || Self.GetStageDone(1834)
    Self.SetStage(1830)
  EndIf
  Alias_Believers.RemoveFromFaction(PlayerEnemyFaction)
  MS02_BelieversFaction.SetEnemy(MS02_RenegadesFaction, True, True)
  MS02_BelieversFaction.SetEnemy(MS02_PragmatistsFaction, True, True)
  Alias_Believers.StopCombat()
  Alias_Believers.EvaluateAll()
  Self.SetObjectiveCompleted(1625, True)
EndFunction

Function Fragment_Stage_1834_Item_00()
  Self.SetObjectiveCompleted(1627, True)
  If Self.GetStageDone(1832)
    Self.SetStage(1830)
  EndIf
  Alias_Pragmatists.RemoveFromFaction(PlayerEnemyFaction)
  MS02_PragmatistsFaction.SetEnemy(MS02_BelieversFaction, True, True)
  MS02_PragmatistsFaction.SetEnemy(MS02_RenegadesFaction, True, True)
  Alias_Pragmatists.StopCombat()
  Alias_Pragmatists.EvaluateAll()
EndFunction

Function Fragment_Stage_1840_Item_00()
  Self.SetObjectiveCompleted(1830, True)
  Self.SetStage(1875)
EndFunction

Function Fragment_Stage_1870_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.EveryoneStopFighting()
EndFunction

Function Fragment_Stage_1872_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.ResetBaseFactions()
EndFunction

Function Fragment_Stage_1875_Item_00()
  Quest __temp = Self as Quest
  ms02script kmyQuest = __temp as ms02script
  kmyQuest.ResetBaseFactions()
  Alias_BackdoorFacility.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_1880_Item_00()
  Self.SetObjectiveCompleted(1880, True)
  Self.SetObjectiveDisplayed(1900, True, False)
  Game.GetPlayer().RemoveItem(Alias_EncryptedOverrideCode.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddAliasedItem(MS02_SecurityOverrideCode as Form, Alias_OverrideCode as Alias, 1, False)
EndFunction

Function Fragment_Stage_1890_Item_00()
  ObjectReference oDoor = Alias_FacilityRestrictedTerminal.GetRef().GetLinkedRef(None)
  oDoor.Activate(Game.GetPlayer() as ObjectReference, False)
  Game.GetPlayer().RemoveItem(Alias_OverrideCode.GetRef() as Form, 1, False, None)
EndFunction

Function Fragment_Stage_1900_Item_00()
  Self.SetObjectiveCompleted(1900, True)
  Self.SetObjectiveCompleted(1600, True)
  Self.SetObjectiveCompleted(1601, True)
  Self.SetObjectiveCompleted(1602, True)
EndFunction

Function Fragment_Stage_1910_Item_00()
  Self.CompleteAllObjectives()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_1920_Item_00()
  Self.CompleteAllObjectives()
  MS02_1900_PC_Kills_Crucible.Start()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_1930_Item_00()
  Self.SetStage(1900)
  Self.SetObjectiveDisplayed(2010, True, False)
EndFunction

Function Fragment_Stage_1940_Item_00()
  Self.SetStage(1900)
  Self.SetObjectiveDisplayed(2020, True, False)
EndFunction

Function Fragment_Stage_1950_Item_00()
  Self.SetStage(1900)
  Self.SetObjectiveDisplayed(2030, True, False)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.CompleteAllObjectives()
  If Self.GetStageDone(1950)
    MS02_GenghisReactivity.SetValue(1.0)
    Float currentGameTime = Utility.GetCurrentGameTime()
    SE_Player_FAB18a_Timestamp.SetValue(currentGameTime + cooldownDays)
  EndIf
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_8810_Item_00()
  If Self.GetStageDone(1820) && !Self.GetStageDone(1822)
    Self.SetStage(1834)
  Else
    Self.SetStage(8900)
  EndIf
EndFunction

Function Fragment_Stage_8820_Item_00()
  If Self.GetStageDone(1620) && !Self.GetStageDone(1622)
    Self.SetStage(1634)
  ElseIf Self.GetStageDone(1820)
    Self.SetStage(1832)
  Else
    Self.SetStage(8900)
  EndIf
EndFunction

Function Fragment_Stage_8830_Item_00()
  If Self.GetStageDone(1620)
    Self.SetStage(1632)
  ElseIf Self.GetStageDone(1720)
    Self.SetStage(1730)
  Else
    Self.SetStage(8900)
  EndIf
EndFunction

Function Fragment_Stage_8840_Item_00()
  If !Self.GetStageDone(1300)
    Self.SetStage(8900)
  EndIf
EndFunction

Function Fragment_Stage_8900_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
