ScriptName Fragments:Quests:QF_UC01_ShipSimQuest_002BA648 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SimShip Auto Const mandatory
ReferenceAlias Property Alias_SimShipSeat Auto Const mandatory
ReferenceAlias Property Alias_ExitRock Auto Const mandatory
Scene Property UC01_ShipSimulatorHelperQuest_600_PlayerDefeated Auto Const mandatory
ReferenceAlias Property Alias_ExitMarker Auto Const mandatory
Quest Property UC01 Auto Const mandatory
Scene Property UC01_ShipSimulatorHelperQuest_200_Intro Auto Const mandatory
Scene Property UC01_ShipSimulatorHelperQuest_1000_ExitSequence Auto Const mandatory
Message Property UC01_DEBUG_ShipSim Auto Const
GlobalVariable Property UC01_ShipSim_PlayerPassedSequence Auto Const mandatory
ReferenceAlias Property Alias_BleedoutTestShip Auto Const mandatory
ReferenceAlias Property Alias_ActiveEnemy Auto Const mandatory
Message Property UC01_DEBUG_ExitingShipSim Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC01_PlayerInSimulator_True Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC01_PlayerInSimulator_False Auto Const mandatory
ReferenceAlias Property Alias_TeleportMarker Auto Const mandatory
GlobalVariable Property UC01_ShipSim_HighestTierReached Auto Const mandatory
GlobalVariable Property UC01_ShipSim_CurrentTier Auto Const mandatory
GlobalVariable Property UC01_ShipSim_PlayedThroughOnce Auto Const mandatory
GlobalVariable Property UC01_ShipSim_HeardIntroOnce Auto Const mandatory
Scene Property UC01_ShipSimQuest_125_FirstTimeEntry Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
wwiseevent Property DRS_UC01_ShipSimulator_Hatch Auto Const mandatory
ReferenceAlias Property Alias_Proctor Auto Const mandatory
ReferenceAlias Property Alias_ProctorMarker Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_WaitMarker Auto Const mandatory
GlobalVariable Property UC01_PilotSeatGlobal Auto Const mandatory
Message Property UC01_ShipSim_ExitPilotSeat Auto Const mandatory
Perk Property UC01_PilotingPerk Auto Const mandatory
RefCollectionAlias Property Alias_ActiveEnemies Auto Const mandatory
Message Property UC01_ShipSim_ExitPilotSeat_Controller Auto Const mandatory
RefCollectionAlias Property Alias_Companions Auto Const mandatory
ReferenceAlias Property Alias_AnimatedDoor Auto Const mandatory
ReferenceAlias Property Alias_ShipInteriorDoor Auto Const mandatory
RefCollectionAlias Property availableCompanions Auto Const mandatory
ActorValue Property FollowerState Auto Const mandatory
Faction Property CurrentCompanionFaction Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference myShip = Alias_BleedoutTestShip.GetRef()
  myShip.Enable(False)
  Alias_ActiveEnemy.ForceRefTo(myShip)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  If Game.UsingGamepad()
    UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
  Else
    UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
  EndIf
  UC01_PilotSeatGlobal.SetValue(1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript
  If UC01_ShipSim_HeardIntroOnce.GetValue() >= 1.0
    Self.SetStage(130)
  EndIf
  Alias_ShipInteriorDoor.GetRef().SetOpen(False)
  ObjectReference SimREF = Alias_SimShip.GetRef()
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.AddPerk(UC01_PilotingPerk, False)
  PlayerREF.MoveTo(Alias_TeleportMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  kmyQuest.SimShipEnablePlayer = inputenablelayer.Create()
  kmyQuest.SimShipEnablePlayer.EnableMenu(False)
  kmyQuest.SimShipEnablePlayer.EnableFastTravel(False)
  kmyQuest.SimShipEnablePlayer.EnableGravJump(False)
  kmyQuest.SimShipEnablePlayer.EnableFarTravel(False)
  kmyQuest.SimShipEnablePlayer.EnableLocationDiscovery(False)
  WwiseEvent_QST_UC01_PlayerInSimulator_True.Play(PlayerREF as ObjectReference, None, None)
  If UC01.IsRunning() && !UC01.GetStageDone(590) && !UC01.GetStageDone(600)
    UC01.SetStage(590)
  EndIf
  If UC01.IsRunning()
    UC01.SetActive(False)
  EndIf
  Self.SetActive(True)
  Self.SetObjectiveDisplayed(100, True, False)
  If !UC01.GetStageDone(1000)
    Alias_Proctor.GetRef().MoveTo(Alias_ProctorMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
  Actor[] teleportedFollowers = availableCompanions.GetActorArray()
  Int I = 0
  While I < teleportedFollowers.Length
    If teleportedFollowers[I].IsinFaction(CurrentCompanionFaction) || teleportedFollowers[I].IsinFaction(AvailableCrewFaction)
      If teleportedFollowers[I].GetValue(FollowerState) != 2.0
        Alias_Companions.AddRef(teleportedFollowers[I] as ObjectReference)
      EndIf
    EndIf
    I += 1
  EndWhile
  Actor[] eligibleCompanions = Alias_Companions.GetActorArray()
  If eligibleCompanions != None
    SQ_Followers.TeleportFollowers(Alias_WaitMarker.GetRef(), eligibleCompanions, True, False, False, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0125_Item_00()
  UC01_ShipSimQuest_125_FirstTimeEntry.Start()
EndFunction

Function Fragment_Stage_0130_Item_00()
  If UC01_ShipSim_HeardIntroOnce.GetValue() < 1.0
    UC01_ShipSim_HeardIntroOnce.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  UC01_ShipSimQuest_125_FirstTimeEntry.Stop()
  UC01_ShipSimulatorHelperQuest_200_Intro.Start()
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest
  uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript
  If !Self.GetStageDone(1)
    kmyQuest.BeginSequence()
  EndIf
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(999, True, False)
  If UC01_ShipSim_PlayerPassedSequence.GetValue() == 0.0
    UC01_ShipSim_PlayerPassedSequence.SetValue(1.0)
  EndIf
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Game.UsingGamepad()
    UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
  Else
    UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0600_Item_00()
  UC01_ShipSimulatorHelperQuest_600_PlayerDefeated.Start()
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetStage(900)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(250, False, False)
  Self.SetObjectiveDisplayed(300, False, False)
  If !Self.GetStageDone(500)
    Self.SetObjectiveDisplayed(999, True, False)
  Else
    Self.SetObjectiveDisplayed(999, False, False)
    Self.SetObjectiveDisplayed(1000, True, False)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  DRS_UC01_ShipSimulator_Hatch.Play(Game.GetPlayer() as ObjectReference, None, None)
  UC01_ShipSimulatorHelperQuest_1000_ExitSequence.Start()
  UC01_ShipSimQuest_125_FirstTimeEntry.Stop()
EndFunction

Function Fragment_Stage_1005_Item_00()
  Alias_ShipInteriorDoor.GetRef().SetOpen(True)
EndFunction

Function Fragment_Stage_1010_Item_00()
  Quest __temp = Self as Quest
  uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript
  kmyQuest.SimShipEnablePlayer.Delete()
  Actor PlayerREF = Game.GetPlayer()
  WwiseEvent_QST_UC01_PlayerInSimulator_False.Play(PlayerREF as ObjectReference, None, None)
  If UC01_ShipSim_PlayedThroughOnce.GetValue() < 1.0
    UC01_ShipSim_PlayedThroughOnce.SetValue(1.0)
  EndIf
  PlayerREF.RemovePerk(UC01_PilotingPerk)
  PlayerREF.MoveTo(Alias_ExitMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetActive(False)
  If UC01.IsRunning()
    UC01.SetActive(True)
  EndIf
  If !UC01.GetStageDone(630)
    Int HighestTierInt = UC01_ShipSim_HighestTierReached.GetValueInt()
    Int CurrentTierInt = UC01_ShipSim_CurrentTier.GetValueInt()
    If HighestTierInt < CurrentTierInt
      UC01_ShipSim_HighestTierReached.SetValue(CurrentTierInt as Float)
    EndIf
  EndIf
  spaceshipreference SimShipRef = Alias_SimShip.GetShipRef()
  SimShipRef.DisableNoWait(False)
  SimShipRef.Delete()
  SQ_PlayerShip.ResetPlayerShip(SQ_PlayerShip.HomeShip.GetShipRef())
  Alias_ActiveEnemies.DisableAll(False)
  Actor[] teleportedFollowers = Alias_Companions.GetActorArray()
  If teleportedFollowers != None
    SQ_Followers.AllFollowersFollow(teleportedFollowers)
  EndIf
  Alias_AnimatedDoor.GetRef().SetOpen(False)
  Self.SetStage(1005)
  Self.Stop()
  Self.Reset()
EndFunction
