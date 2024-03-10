ScriptName CF_PostQuestScript Extends Quest
{ Quest script for CF_Post, the CF Postquest Script. }

;-- Variables ---------------------------------------
Int CONST_CaptainState_Active = 0 Const
Int CONST_CaptainState_Dead = 2 Const
Int CONST_CaptainState_Freed = 4 Const
Int CONST_CaptainState_Imprisoned = 3 Const
Int CONST_CaptainState_Inactive = 1 Const
Int CONST_Stage_PostquestFinal_CF = 110 Const
Int CONST_Stage_PostquestFinal_SD = 210 Const
Int CONST_Stage_PostquestStartup_CF = 100 Const
Int CONST_Stage_PostquestStartup_SD = 200 Const
Int CONST_Stage_QuickstartCF = 0 Const
Int CONST_Stage_QuickstartSD = 1 Const
Float CONST_VigilanceCrippledHealthPercent = 0.050000001 Const
Bool waitingForPlayerToSit

;-- Properties --------------------------------------
Group QuestProperties
  ActorValue[] Property VigilanceSystemActorValues Auto Const mandatory
  dialogueshipservicesscript Property DialogueShipServices Auto Const mandatory
EndGroup

Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  LocationAlias Property SuvorovOrbitLocation Auto Const mandatory
  ReferenceAlias Property TheKey Auto Const mandatory
  ReferenceAlias Property Vigilance Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property TheKeyMapMarker Auto Const mandatory
  ReferenceAlias Property Captain_RokovShip Auto Const mandatory
  ReferenceAlias Property Captain_MathisShip Auto Const mandatory
  ReferenceAlias Property Captain_NaevaShip Auto Const mandatory
  ReferenceAlias Property Captain_AdlerShip Auto Const mandatory
  ReferenceAlias Property Captain_HuanShip Auto Const mandatory
  ReferenceAlias Property Captain_EstelleShip Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Rokov Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Mathis Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Naeva Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Adler Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Huan Auto Const mandatory
  GlobalVariable Property CrimsonFleetCaptainState_Estelle Auto Const mandatory
  ReferenceAlias Property CFPost_CFVigilanceMarker Auto Const mandatory
  ReferenceAlias Property CFPost_SDVigilanceMarker Auto Const mandatory
  Faction Property CrimeFactionUC Auto Const mandatory
  Faction Property UCSysDefFaction Auto Const mandatory
  Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
  ActorValue Property Health Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function QuickstartToKey()
  Actor player = Game.GetPlayer()
  inputenablelayer myEnableLayer = inputenablelayer.Create()
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False)
  spaceshipreference playerShipRef = PlayerShip.GetShipRef()
  playerShipRef.InstantUndock()
  playerShipRef.MoveTo(TheKeyMapMarker.GetRef().GetLinkedRef(None), 0.0, 0.0, 0.0, True, False)
  player.MoveTo(playerShipRef as ObjectReference, 0.0, 0.0, 0.0, True, False)
  PlayerShipPilotSeat.GetRef().Activate(player as ObjectReference, False)
  myEnableLayer.Delete()
EndFunction

Function RegisterForPostquestLocationChange()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
EndFunction

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
  Location survorovOrbitLoc = SuvorovOrbitLocation.GetLocation()
  If akNewLoc != survorovOrbitLoc && !survorovOrbitLoc.IsChild(akNewLoc)
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
    If Self.GetStageDone(CONST_Stage_PostquestStartup_CF)
      Self.SetStage(CONST_Stage_PostquestFinal_CF)
    ElseIf Self.GetStageDone(CONST_Stage_PostquestStartup_SD)
      Self.SetStage(CONST_Stage_PostquestFinal_SD)
    EndIf
  EndIf
EndEvent

Function CF_CleanupAllCaptainShips()
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Rokov.GetValueInt(), Captain_RokovShip)
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Mathis.GetValueInt(), Captain_MathisShip)
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Naeva.GetValueInt(), Captain_NaevaShip)
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Adler.GetValueInt(), Captain_AdlerShip)
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Huan.GetValueInt(), Captain_HuanShip)
  Self.CF_CleanupCaptainShip(CrimsonFleetCaptainState_Estelle.GetValueInt(), Captain_EstelleShip)
EndFunction

Function CF_CleanupCaptainShip(Int captainState, ReferenceAlias captainShip)
  If captainState == CONST_CaptainState_Active
    spaceshipreference captainShipRef = captainShip.GetShipRef()
    captainShipRef.EnableNoWait(False)
    If captainShipRef.IsDockedWith(Vigilance.GetShipRef())
      captainShipRef.InstantUndock()
    EndIf
    captainShip.TryToEvaluatePackage()
    captainShipRef.InstantDock(TheKey.GetShipRef() as ObjectReference)
  EndIf
EndFunction

Function CF_ConvertVigilance()
  spaceshipreference vigilanceRef = Vigilance.GetShipRef()
  vigilanceRef.RemoveFromFaction(CrimeFactionUC)
  vigilanceRef.RemoveFromFaction(UCSysDefFaction)
  vigilanceRef.AddToFaction(CrimeFactionCrimsonFleet)
EndFunction

Function CF_DisableCaptainShips()
  Captain_RokovShip.TryToDisableNoWait()
  Captain_MathisShip.TryToDisableNoWait()
  Captain_AdlerShip.TryToDisableNoWait()
  Captain_HuanShip.TryToDisableNoWait()
  Captain_EstelleShip.TryToDisableNoWait()
EndFunction

Function CF_MoveAndCrippleVigilance()
  spaceshipreference vigilanceRef = Vigilance.GetShipRef()
  vigilanceRef.Enable(False)
  vigilanceRef.MoveTo(CFPost_CFVigilanceMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Int I = 0
  While I < VigilanceSystemActorValues.Length
    vigilanceRef.EnablePartRepair(VigilanceSystemActorValues[I], False)
    vigilanceRef.DamageValue(VigilanceSystemActorValues[I], vigilanceRef.GetValue(VigilanceSystemActorValues[I]))
    I += 1
  EndWhile
  vigilanceRef.EnablePartRepair(Health, False)
  vigilanceRef.DamageValue(Health, vigilanceRef.GetValue(Health) * (1.0 - CONST_VigilanceCrippledHealthPercent))
EndFunction

Function SD_CleanupAllCaptainShips()
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Rokov.GetValueInt(), Captain_RokovShip)
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Mathis.GetValueInt(), Captain_MathisShip)
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Naeva.GetValueInt(), Captain_NaevaShip)
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Adler.GetValueInt(), Captain_AdlerShip)
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Huan.GetValueInt(), Captain_HuanShip)
  Self.SD_CleanupCaptainShip(CrimsonFleetCaptainState_Estelle.GetValueInt(), Captain_EstelleShip)
EndFunction

Function SD_CleanupCaptainShip(Int captainState, ReferenceAlias captainShip)
  If captainState == CONST_CaptainState_Active
    captainShip.GetShipRef().DisableNoWait(False)
  EndIf
EndFunction

Function SD_MoveVigilance()
  spaceshipreference vigilanceRef = Vigilance.GetShipRef()
  vigilanceRef.Enable(False)
  vigilanceRef.MoveTo(CFPost_SDVigilanceMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction
