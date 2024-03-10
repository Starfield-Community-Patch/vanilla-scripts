ScriptName MQ101Script Extends Quest

;-- Variables ---------------------------------------
Bool MarkedForNGShutdown
Int SaveTimerID = 20 Const
Int timerInitID = 1 Const

;-- Properties --------------------------------------
Group VascoCrew_Properties
  sq_crewscript Property SQ_Crew Auto Const mandatory
  { SQ_Crew quest for assigning crew }
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { SQ_Companinos for assigning companion }
EndGroup

inputenablelayer Property VSEnableLayer Auto hidden
GlobalVariable Property MQ101Debug Auto Const mandatory
ReferenceAlias Property CharGenFurniture Auto Const mandatory
ReferenceAlias Property MineBoringMachine Auto Const mandatory
ObjectReference Property MQ101_Scene05_MarkerPlayer Auto Const mandatory
ReferenceAlias Property Heller Auto Const mandatory
ObjectReference Property MQ101_LGT_A Auto Const mandatory
ObjectReference Property MQ101_LGT_B Auto Const mandatory
Scene[] Property MQ101_013A_FlightScenes Auto Const
{ array of flight tutorial scenes that need to be stopped if player skips past tutorial }
ReferenceAlias Property Vasco Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
Bool Property setHomeShipOnInit = False Auto hidden
{ set by startup stages - since this calls SQ_PlayerShip, can't be done from startup stage during New Game start - SQ_PlayerShip isn't running yet }
Bool Property moveVascoToShipOnInit = False Auto hidden
{ same as above - need to do this after startup }
Bool Property setVascoAsCrewOnInit = False Auto hidden
{ same as above - need to do this after startup }
ReferenceAlias Property Alias_BarrettShip Auto Const mandatory
LocationAlias Property BarrettShip_ExteriorLocation Auto Const mandatory
LocationAlias Property BarrettShip_InteriorLocation Auto Const mandatory
ReferenceAlias Property BarrettPilotChair Auto Const mandatory
ReferenceAlias Property BarrettShipDoor Auto Const mandatory
ReferenceAlias Property BarrettShipCrewMarker Auto Const mandatory
ReferenceAlias Property BarrettShipSmallItemMarker01 Auto Const mandatory
ReferenceAlias Property BarrettShipSmallItemMarker02 Auto Const mandatory
ReferenceAlias Property BarrettShipSmallItemMarker03 Auto Const mandatory
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
spaceshipreference Property MQPlayerStarbornShipREF Auto Const mandatory
Message Property Tutorial_Inventory Auto Const mandatory
Message Property Tutorial_Inventory02 Auto Const mandatory
Message Property Tutorial_Inventory03 Auto Const mandatory
Message Property Tutorial_Inventory04 Auto Const mandatory
Message Property Tutorial_FastTravel_01 Auto Const mandatory
Message Property Tutorial_FastTravel_02 Auto Const mandatory
Message Property Tutorial_FastTravel_03 Auto Const mandatory
Int Property TutorialFastTravel01Stage = 900 Auto Const
Int Property TutorialFastTravel02Stage = 910 Auto Const
Int Property TutorialFastTravel03Stage = 920 Auto Const
Int Property TutorialFastTravel04Stage = 930 Auto Const
GlobalVariable Property MQ101SaveOff Auto Const mandatory
Int Property SetUpCharGenStage = 63 Auto Const
Int Property DrillerInPositionStage = 33 Auto Const
Int Property CharGenDoneStage = 105 Auto Const
Int Property PlanetViewPrereqStage = 606 Auto Const
Int Property PlanetViewMapOpenedStage = 608 Auto Const
Int Property PlanetViewAlreadyLandedStage = 607 Auto Const
Int Property SetCoursePrereqStage = 1000 Auto Const
Int Property SetCourseDataMenuStage = 1005 Auto Const
Int Property SetCourseMissionsMenuStage = 1010 Auto Const
Int Property SetCourseGalaxyMenuStage = 1020 Auto Const
Message Property Tutorial_SetCourse01 Auto Const mandatory
Message Property Tutorial_SetCourse02 Auto Const mandatory
Message Property Tutorial_SetCourse03 Auto Const mandatory
GlobalVariable Property MQ101VascoQuestFollower Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer()
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnPlayerModifiedShip")
  If MQ101Debug.GetValueInt() == 1
    Self.SetStage(400)
  EndIf
EndEvent

Event Actor.OnPlayerModifiedShip(Actor akSource, spaceshipreference akShip)
  spaceshipreference BarrettShipRef = Alias_BarrettShip.GetShipRef()
  If akShip == BarrettShipRef
    Self.ResetBarrettShip(akShip)
  EndIf
EndEvent

Function ResetBarrettShip(spaceshipreference newShip)
  Alias_BarrettShip.ForceRefTo(newShip as ObjectReference)
  newShip.SetExteriorLoadDoorInaccessible(False)
  BarrettShip_ExteriorLocation.ClearAndRefillAlias()
  BarrettShip_InteriorLocation.ClearAndRefillAlias()
  BarrettPilotChair.ClearAndRefillAlias()
  BarrettShipDoor.ClearAndRefillAlias()
  BarrettShipCrewMarker.ClearAndRefillAlias()
  BarrettShipSmallItemMarker01.ClearAndRefillAlias()
  BarrettShipSmallItemMarker02.ClearAndRefillAlias()
  BarrettShipSmallItemMarker03.ClearAndRefillAlias()
EndFunction

Function StartInitTimer(Bool setVascoAsCrew, Bool moveVasco, Bool setHomeShip)
  setVascoAsCrewOnInit = setVascoAsCrew
  moveVascoToShipOnInit = moveVasco
  setHomeShipOnInit = setHomeShip
  Self.startTimer(1.0, timerInitID)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == timerInitID
    If SQ_PlayerShip.IsRunning() == False
      Self.startTimer(1.0, timerInitID)
    ElseIf Self.IsStarting() == True
      Self.startTimer(1.0, timerInitID)
    Else
      If setHomeShipOnInit
        Actor PlayerREF = Game.GetPlayer()
        If PlayerREF.GetValueInt(PlayerUnityTimesEntered) > 0
          SQ_PlayerShip.ResetHomeShip(MQPlayerStarbornShipREF)
          If MQ101SaveOff.GetValueInt() == 0
            Self.startTimer(2.0, SaveTimerID)
          Else
            Self.EnableSaveAndCheckForNGShutdown()
          EndIf
          Game.RequestSave()
        Else
          spaceshipreference FrontierShipREF = Alias_BarrettShip.GetShipRef()
          SQ_PlayerShip.ResetHomeShip(FrontierShipREF)
        EndIf
      EndIf
      If setVascoAsCrewOnInit
        Self.AssignVascoAsCrew()
      EndIf
      If moveVascoToShipOnInit
        SQ_PlayerShip.LoadVascoInterior()
      EndIf
    EndIf
  EndIf
  If aiTimerID == SaveTimerID
    If MQ101SaveOff.GetValueInt() == 0
      Self.startTimer(2.0, SaveTimerID)
    Else
      Self.EnableSaveAndCheckForNGShutdown()
    EndIf
  EndIf
EndEvent

Function EnableSaveAndCheckForNGShutdown()
  Game.SetInCharGen(False, False, False)
  MQ101SaveOff.SetValueInt(0)
  If MarkedForNGShutdown
    Self.Stop()
  EndIf
EndFunction

Function ShutdownMQ101ViaNG()
  MarkedForNGShutdown = True
  If MQ101SaveOff.GetValueInt() == 0
    Self.Stop()
  EndIf
EndFunction

Function StartCharGen()
  Actor HellerREF = Heller.GetActorRef()
  If !Self.RegisterForAnimationEvent(HellerREF as ObjectReference, "CharacterGenStart")
    Self.RegisterForRemoteEvent(HellerREF as ScriptObject, "OnLoad")
  EndIf
EndFunction

Function RegisterForDrill()
  Self.RegisterForAnimationEvent(MineBoringMachine.GetRef(), "ExitLoopEnd")
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSender)
  Actor HellerREF = Heller.GetActorRef()
  If !Self.RegisterForAnimationEvent(HellerREF as ObjectReference, "CharacterGenStart")
    
  EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Actor HellerREF = Heller.GetActorRef()
  Actor PlayerREF = Game.GetPlayer()
  ObjectReference DrillerREF = MineBoringMachine.GetRef()
  If akSource == HellerREF as ObjectReference
    Self.SetStage(SetUpCharGenStage)
  ElseIf akSource == DrillerREF
    Self.SetStage(DrillerInPositionStage)
  EndIf
EndEvent

Function SetUpChargen()
  Actor PlayerREF = Game.GetPlayer()
  Game.FadeOutGame(True, True, 0.0, 0.100000001, True)
  Utility.Wait(0.5)
  MQ101_LGT_A.DisableNoWait(False)
  MQ101_LGT_B.EnableNoWait(False)
  Self.RegisterForMenuOpenCloseEvent("ChargenMenu")
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnGetUp")
  CharGenFurniture.GetRef().Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
  Actor PlayerREF = Game.GetPlayer()
  Game.FadeOutGame(False, True, 0.5, 0.100000001, False)
  Game.ShowRaceMenu(None, 0, None, None, None)
  CharGenFurniture.GetRef().BlockActivation(True, True)
  Self.UnRegisterForRemoteEvent(PlayerREF as ScriptObject, "OnGetUp")
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ChargenMenu"
    If abOpening == False
      Self.SetStage(CharGenDoneStage)
    EndIf
  EndIf
  If asMenuName == "DataMenu"
    If abOpening
      If Self.GetStageDone(165) && !Self.GetStageDone(168) && !Self.GetStageDone(167)
        Self.RegisterForTutorialEvent("OnHelmetTabOpened")
        Self.RegisterForMenuOpenCloseEvent("InventoryMenu")
        Message.ClearHelpMessages()
        Tutorial_Inventory02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
        Self.SetStage(166)
      EndIf
    ElseIf Self.GetStageDone(168)
      Message.ClearHelpMessages()
    EndIf
    If !abOpening
      If Self.GetStageDone(165) && !Self.GetStageDone(168) && !Self.GetStageDone(167)
        Message.ClearHelpMessages()
      EndIf
    EndIf
    If abOpening
      Self.ClearStarMapTutorial()
    EndIf
    If abOpening && Self.GetStageDone(SetCoursePrereqStage)
      Message.ClearHelpMessages()
      Self.SetStage(SetCourseDataMenuStage)
      Self.RegisterForMenuOpenCloseEvent("BSMissionMenu")
      Tutorial_SetCourse02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
    EndIf
    If !abOpening && Self.GetStageDone(SetCoursePrereqStage) && !Self.GetStageDone(SetCourseGalaxyMenuStage)
      Message.ClearHelpMessages()
      Tutorial_SetCourse01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
    EndIf
  EndIf
  If asMenuName == "InventoryMenu"
    If abOpening
      If !Self.GetStageDone(167)
        Message.ClearHelpMessages()
        Tutorial_Inventory03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
        Self.SetStage(167)
      EndIf
    EndIf
  EndIf
  If asMenuName == "MonocleMenu"
    If abOpening
      If Self.GetStageDone(TutorialFastTravel01Stage) && !Self.GetStageDone(TutorialFastTravel03Stage) && !Self.GetStageDone(TutorialFastTravel04Stage)
        Message.ClearHelpMessages()
        Tutorial_FastTravel_02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
        Self.SetStage(TutorialFastTravel02Stage)
      EndIf
    ElseIf Self.GetStageDone(TutorialFastTravel01Stage) && !Self.GetStageDone(TutorialFastTravel03Stage)
      Message.ClearHelpMessages()
      Tutorial_FastTravel_01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
    EndIf
  EndIf
  If asMenuName == "BSMissionMenu"
    If abOpening && !Self.GetStageDone(SetCourseGalaxyMenuStage)
      Message.ClearHelpMessages()
      Self.SetStage(SetCourseMissionsMenuStage)
      Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
      Tutorial_SetCourse03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
    ElseIf !abOpening && !Self.GetStageDone(SetCourseGalaxyMenuStage)
      Message.ClearHelpMessages()
      Tutorial_SetCourse02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
    EndIf
  EndIf
  If asMenuName == "GalaxyStarMapMenu"
    If abOpening
      If Self.GetStageDone(TutorialFastTravel01Stage) && !Self.GetStageDone(TutorialFastTravel03Stage) && !Self.GetStageDone(TutorialFastTravel04Stage)
        Message.ClearHelpMessages()
        Tutorial_FastTravel_03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
        Self.SetStage(TutorialFastTravel03Stage)
      EndIf
    ElseIf Self.GetStageDone(TutorialFastTravel03Stage)
      Message.ClearHelpMessages()
    EndIf
    If Self.GetStageDone(PlanetViewPrereqStage) && !Self.GetStageDone(PlanetViewAlreadyLandedStage) && !Self.GetStageDone(PlanetViewMapOpenedStage)
      Self.SetStage(PlanetViewMapOpenedStage)
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
    EndIf
    If Self.GetStageDone(SetCourseMissionsMenuStage)
      Message.ClearHelpMessages()
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
      Self.UnRegisterForMenuOpenCloseEvent("BSMissionMenu")
      Self.UnRegisterForMenuOpenCloseEvent("DataMenu")
      Self.UnRegisterForPlayerTeleport()
    EndIf
  EndIf
EndEvent

Event OnPlayerTeleport()
  Message.ClearHelpMessages()
  If Self.GetStageDone(TutorialFastTravel04Stage) == False
    Message.ClearHelpMessages()
    Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu")
    Self.UnRegisterForPlayerTeleport()
    Self.SetStage(TutorialFastTravel04Stage)
  EndIf
  If Self.GetStageDone(SetCourseDataMenuStage)
    Message.ClearHelpMessages()
    Self.UnRegisterForMenuOpenCloseEvent("DataMenu")
    Self.UnRegisterForPlayerTeleport()
    Self.SetStage(SetCourseGalaxyMenuStage)
  EndIf
EndEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
  If asEventName == "OnHelmetTabOpened"
    Message.ClearHelpMessages()
    Tutorial_Inventory04.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
  EndIf
EndEvent

Function StopFlightTutorialScenes()
  Int I = 0
  While I < MQ101_013A_FlightScenes.Length
    MQ101_013A_FlightScenes[I].Stop()
    I += 1
  EndWhile
EndFunction

Function AssignVascoAsCrew()
  MQ101VascoQuestFollower.SetValueInt(1)
  Vasco.GetActorRef().SetPlayerTeammate(True, False, False)
EndFunction

Function MQ101DisablePlayerControls()
  VSEnableLayer = inputenablelayer.Create()
  VSEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
EndFunction

Function MQ101EnablePlayerControls()
  VSEnableLayer = None
EndFunction

Function StarMapTutorial()
  Self.RegisterForMenuOpenCloseEvent("DataMenu")
EndFunction

Function ClearStarMapTutorial()
  If Self.GetStageDone(510)
    Message.ClearHelpMessages()
  EndIf
EndFunction

Function InventoryTutorial()
  Tutorial_Inventory.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
  Self.RegisterForMenuOpenCloseEvent("DataMenu")
EndFunction

Function FastTravelTutorial()
  Tutorial_FastTravel_01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu")
  Self.RegisterForPlayerTeleport()
EndFunction

Function PlanetViewTutorial()
  Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu")
EndFunction

Function SetCourseTutorial()
  Self.RegisterForMenuOpenCloseEvent("DataMenu")
  Self.RegisterForPlayerTeleport()
  Tutorial_SetCourse01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None)
EndFunction
