ScriptName Game Extends ScriptObject Native hidden

;-- Properties --------------------------------------
Int Property MissionBoardFaction_None = -1 AutoReadOnly
Int Property MissionBoardFaction_UnitedColonies = 0 AutoReadOnly
Int Property MissionBoardFaction_RyujinIndustries = 1 AutoReadOnly
Int Property MissionBoardFaction_HouseVaruun = 2 AutoReadOnly
Int Property MissionBoardFaction_Freestar = 3 AutoReadOnly
Int Property MissionBoardFaction_CrimsonFleet = 4 AutoReadOnly
Int Property MissionBoardFaction_Constellation = 5 AutoReadOnly

;-- Functions ---------------------------------------

Function AddAchievement(Int aiAchievementID) Global Native

Function AddPerkPoints(Int aiPerkPoints) Global Native

Function AddPlayerOwnedShip(spaceshipreference arRef) Global Native

Bool Function AddToAvailableCrew(Actor akActor) Global Native

Function AdvanceSkill(String asSkillName, Float afMagnitude) Global Native

Bool Function AreHostileActorsNear() Global Native

Function ClearPrison() Global Native

Function ClearTempEffects() Global Native

Function CreateStarbornGame() Global Native

Function EnablePipboyHDRMask(Bool abEnable) Global Native

Function FadeOutGame(Bool abFadingOut, Bool abBlackFade, Float afSecsBeforeFade, Float afFadeDuration, Bool abStayFaded) Global Native

Function FastTravel(ObjectReference akDestination) Global Native

Actor Function FindClosestActor(Float afX, Float afY, Float afZ, Float afRadius) Global Native

Actor Function FindClosestLivingActor(Float afX, Float afY, Float afZ, Float afRadius) Global Native

ObjectReference Function FindClosestReferenceOfAnyTypeInList(FormList arBaseObjects, Float afX, Float afY, Float afZ, Float afRadius) Global Native

ObjectReference Function FindClosestReferenceOfType(Form arBaseObject, Float afX, Float afY, Float afZ, Float afRadius) Global Native

Actor Function FindRandomActor(Float afX, Float afY, Float afZ, Float afRadius) Global Native

Actor Function FindRandomLivingActor(Float afX, Float afY, Float afZ, Float afRadius) Global Native

ObjectReference Function FindRandomReferenceOfAnyTypeInList(FormList arBaseObjects, Float afX, Float afY, Float afZ, Float afRadius) Global Native

ObjectReference Function FindRandomReferenceOfType(Form arBaseObject, Float afX, Float afY, Float afZ, Float afRadius) Global Native

Function ForceDisableSSRDirLight(Bool abDisableSSR, Bool abDisableDirLight) Global Native

Function ForceFirstPerson() Global Native

Function ForceThirdPerson() Global Native

Function GameplayAutomatedTestComplete(Bool abSuccessful) Global Native

ActorValue Function GetAggressionAV() Global Native

ActorValue Function GetAgilityAV() Global Native

Location[] Function GetAllLocations() Global Native

Float Function GetCameraHeadingAngle(ObjectReference akTarget) Global Native

ActorValue Function GetCharismaAV() Global Native

ActorValue Function GetConfidenceAV() Global Native

Int Function GetDifficulty() Global Native

ActorValue Function GetEnduranceAV() Global Native

Form Function GetForm(Int aiFormID) Global Native

Form Function GetFormFromFile(Int aiFormID, String asFilename) Global Native

Bool Function GetGameSettingBool(String asGameSetting) Global Native

Float Function GetGameSettingFloat(String asGameSetting) Global Native

Int Function GetGameSettingInt(String asGameSetting) Global Native

String Function GetGameSettingString(String asGameSetting) Global Native

Int Function GetGameSettingUInt(String asGameSetting) Global Native

ActorValue Function GetHealthAV() Global Native

ActorValue Function GetIntelligenceAV() Global Native

ActorValue Function GetInvulnerableAV() Global Native

Float Function GetLocalTime() Global Native

ActorValue Function GetLuckAV() Global Native

Location[] Function GetMatchingLocations(Location ParentLocation, Keyword[] WantedKeywords, Keyword[] UnwantedKeywords, LocationRefType[] WantedRefTypes, LocationRefType[] UnwantedRefTypes, Bool MustFindAllWantedKeywords, Bool MustNotFindAnyUnwantedKeywords, Bool MustFindAllWantedRefTypes, Bool MustNotFindAnyUnwantedRefTypes, Int LimitOfLocationsToReturn) Global Native

ActorValue Function GetPerceptionAV() Global Native

Actor Function GetPlayer() Global Native

Int[] Function GetPlayerActiveDialogueUnsaidInfo() Global Native

Quest[] Function GetPlayerActiveQuests() Global Native

Actor[] Function GetPlayerFollowers() Global Native

ObjectReference Function GetPlayerGrabbedRef() Global Native

spaceshipreference Function GetPlayerHomeSpaceShip() Global Native

spaceshipreference[] Function GetPlayerOwnedShips() Global Native

Float Function GetPlayerRadioFrequency() Global Native

Actor Function GetPlayersLastRiddenHorse() Global Native

Float Function GetRealHoursPassed() Global Native

ActorValue Function GetStrengthAV() Global Native

ActorValue Function GetSuspiciousAV() Global Native

Int Function GetXPForLevel(Int auiLevel) Global Native

Function HideContrabandScanWarning(Bool abSkipCompletionAnim, Bool abWasDetectionEvaded) Global Native

Function HideHudMenus() Global Native

Function HideTitleSequenceMenu() Global Native

Function IncrementSkill(ActorValue akActorValue, Int aiCount) Global Native

Function IncrementStat(String asStatName, Int aiModAmount) Global Native

Bool Function IsActivateControlsEnabled() Global Native

Bool Function IsAutomatedTestControllingPlayerInProgress() Global Native

Bool Function IsCamSwitchControlsEnabled() Global Native

Bool Function IsFarTravelControlsEnabled() Global Native

Bool Function IsFastTravelControlsEnabled() Global Native

Bool Function IsFastTravelEnabled() Global Native

Bool Function IsFavoritesControlsEnabled() Global Native

Bool Function IsFightingControlsEnabled() Global Native

Bool Function IsGravJumpControlsEnabled() Global Native

Bool Function IsGuardPursuingPlayer() Global Native

Bool Function IsJournalControlsEnabled() Global Native

Bool Function IsJumpingControlsEnabled() Global Native

Bool Function IsLookingControlsEnabled() Global Native

Bool Function IsMenuControlsEnabled() Global Native

Bool Function IsMovementControlsEnabled() Global Native

Bool Function IsPlayerInDialogue() Global Native

Bool Function IsPlayerInMessageBox() Global Native

Bool Function IsPlayerInRadioRange(Float afFrequency) Global Native

Bool Function IsPlayerListening(Float afFrequency) Global Native

Bool Function IsPlayerLoitering() Global Native

Bool Function IsPlayerRadioOn() Global Native

Bool Function IsPlayerSpaceshipOwner(spaceshipreference arRef) Global Native

Bool Function IsPluginInstalled(String asName) Global Native

Bool Function IsResearchComplete(researchproject akResearchProject) Global Native

Bool Function IsSneakingControlsEnabled() Global Native

Bool Function IsTakeoffControlsEnabled() Global Native

Bool Function IsVATSControlsEnabled() Global Native

Bool Function IsVATSPlaybackActive() Global Native

Function PassTime(Int aiHours) Global Native

Function PlayBink(String asFilename, Bool abInterruptible, Bool abMuteAudio, Bool abMuteMusic, Bool abLetterbox, Bool abIsNewGameBink) Global Native

Function PlayBinkNoWait(String asFilename, Bool abInterruptible, Bool abMuteAudio, Bool abMuteMusic, Bool abLetterbox, Bool abIsNewGameBink, Bool aPlayDuringLoadingScreen) Global Native

Function PlayEventCamera(camerashot akCamera, ObjectReference akRef) Global Native

Bool Function PopPlayerTo(ObjectReference akTarget, Float afXOffset, Float afYOffset, Float afZOffset, Bool abMatchRotation, Bool abCheckForCollision) Global Native

Function PrecacheCharGen() Global Native

Function PrecacheCharGenClear() Global Native

Int Function QueryStat(String asStat) Global Native

Function QuitToMainMenu() Global Native

Function RemoveFromAvailableCrew(Actor akActor) Global Native

Bool Function RemovePlayerOwnedShip(spaceshipreference arRef) Global Native

Function RequestAutoSave() Global Native

Function RequestDialogueExit() Global Native

Function RequestDialogueSelect(Int aiIndex) Global Native

Function RequestDialogueSkip() Global Native

Function RequestGameplayBotState(ObjectReference arRef, Int aiState) Global Native

Function RequestHUDRolloverRefresh() Global Native

Function RequestMessageBoxSelect(Int aiIndex) Global Native

Function RequestModel(String asModelName) Global Native

Function RequestSave() Global Native

Function RequestSaveByName(String asSaveName) Global Native

Function RewardPlayerXP(Int auiXPAmount, Bool abDirect) Global Native

Function ServeTime() Global Native

Function SetCameraTarget(Actor arTarget) Global Native

Function SetCharGenHUDMode(Int aiCGHUDMode) Global Native

Function SetHandscannerDistortionLevel(Int aLevel) Global Native

Function SetInChargen(Bool abDisableSaving, Bool abDisableWaiting, Bool abShowControlsDisabledMessage) Global Native

Function SetLocalTime(Float afLocalTime) Global Native

Function SetPlayerAIDriven(Bool abAIDriven) Global Native

Function SetPlayerOnElevator(Bool abOnElevator) Global Native

Function SetPlayerRadioFrequency(Float afFrequency) Global Native

Function SetPlayerReportCrime(Bool abReportCrime) Global Native

Function SetSittingRotation(Float afValue) Global Native

Function ShakeCamera(ObjectReference akSource, Float afStrength, Float afDuration) Global Native

Function ShakeController(Float afSmallMotorStrength, Float afBigMotorStreangth, Float afDuration) Global Native

Function ShowAllMapMarkers() Global Native

Function ShowContrabandScanWarning(Int aiChanceToEvadeDetection, Bool abScanInProgress) Global Native

Function ShowCustomWatchAlert(String aAnimName) Global Native

Function ShowFatigueWarningOnHUD() Global Native

Function ShowFirstPersonGeometry(Bool abShow) Global Native

Function ShowGalaxyStarMapMenu() Global Native

Function ShowMissionBoardMenu(Keyword akFilterByKeyword, Int iFaction) Global Native

Function ShowPipboyBootSequence(String asAnimationName) Global Native

Function ShowPipboyPlugin() Global Native

Function ShowRaceMenu(ObjectReference akMenuTarget, Int uiMode, ObjectReference akMenuSpouseFemale, ObjectReference akMenuSpouseMale, ObjectReference akVendor) Global Native

Function ShowTitleSequenceMenu() Global Native

Function StartDialogueCameraOrCenterOnTarget(ObjectReference akCameraTarget) Global Native

Function StartTitleSequence(String asSequenceName) Global Native

Function StopDialogueCamera(Bool abConsiderResume, Bool abSwitchingTo1stP) Global Native

Function TriggerScreenBlood(Int aiValue) Global Native

Bool Function TrySetPlayerHomeSpaceShip(ObjectReference akHomeShip) Global Native

Function TurnPlayerRadioOn(Bool abRadioOn) Global Native

Bool Function UsingGamepad() Global Native

Function error(String asMessage) Global Native

Function warning(String asMessage) Global Native

ObjectReference Function FindClosestReferenceOfTypeFromRef(Form arBaseObject, ObjectReference arCenter, Float afRadius) Global
  Return Game.FindClosestReferenceOfType(arBaseObject, arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

ObjectReference Function FindRandomReferenceOfTypeFromRef(Form arBaseObject, ObjectReference arCenter, Float afRadius) Global
  Return Game.FindRandomReferenceOfType(arBaseObject, arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

ObjectReference Function FindClosestReferenceOfAnyTypeInListFromRef(FormList arBaseObjects, ObjectReference arCenter, Float afRadius) Global
  Return Game.FindClosestReferenceOfAnyTypeInList(arBaseObjects, arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

ObjectReference Function FindRandomReferenceOfAnyTypeInListFromRef(FormList arBaseObjects, ObjectReference arCenter, Float afRadius) Global
  Return Game.FindRandomReferenceOfAnyTypeInList(arBaseObjects, arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

Actor Function FindClosestActorFromRef(ObjectReference arCenter, Float afRadius) Global
  Return Game.FindClosestActor(arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

Actor Function FindClosestLivingActorFromRef(ObjectReference arCenter, Float afRadius) Global
  Return Game.FindClosestLivingActor(arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

Actor Function FindRandomActorFromRef(ObjectReference arCenter, Float afRadius) Global
  Return Game.FindRandomActor(arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

Actor Function FindRandomLivingActorFromRef(ObjectReference arCenter, Float afRadius) Global
  Return Game.FindRandomLivingActor(arCenter.X, arCenter.Y, arCenter.Z, afRadius)
EndFunction

Location Function GetMatchingLocation(Location ParentLocation, Keyword[] WantedKeywords, Keyword[] UnwantedKeywords, LocationRefType[] WantedRefTypes, LocationRefType[] UnwantedRefTypes, Bool MustFindAllWantedKeywords, Bool MustNotFindAnyUnwantedKeywords, Bool MustFindAllWantedRefTypes, Bool MustNotFindAnyUnwantedRefTypes) Global
  Location[] foundLocations = Game.GetMatchingLocations(ParentLocation, WantedKeywords, UnwantedKeywords, WantedRefTypes, UnwantedRefTypes, MustFindAllWantedKeywords, MustNotFindAnyUnwantedKeywords, MustFindAllWantedRefTypes, MustNotFindAnyUnwantedRefTypes, 1)
  Location matchingLocation = None
  If foundLocations as Bool && foundLocations.Length > 0
    matchingLocation = foundLocations[0]
  EndIf
  Return matchingLocation
EndFunction

MiscObject Function GetCaps() Global
  Return Game.GetForm(15) as MiscObject
EndFunction

MiscObject Function GetCredits() Global
  Return Game.GetForm(15) as MiscObject
EndFunction

Int Function GetDieRoll(Int MinResult, Int NumberOfSides, Int DebugDieRoll) Global
  Int dieRoll = 0
  If DebugDieRoll == -1
    dieRoll = Utility.RandomInt(MinResult, NumberOfSides)
  Else
    dieRoll = DebugDieRoll
  EndIf
  Return dieRoll
EndFunction

Bool Function GetDieRollSuccess(Int Chance, Int MinResult, Int NumberOfSides, Int DebugDieRoll, Int ForcedDieRoll) Global
  Int dieRoll = ForcedDieRoll
  If dieRoll < 0 || DebugDieRoll != -1
    dieRoll = Game.GetDieRoll(MinResult, NumberOfSides, DebugDieRoll)
  EndIf
  Return dieRoll <= Chance
EndFunction

Int Function GetPlayerLevel() Global
  Return (Game.GetPlayer().GetBaseObject() as ActorBase).GetLevelExact()
EndFunction

Function GivePlayerCaps(Int nCaps) Global
  If nCaps > 0
    Game.GetPlayer().AddItem(Game.GetCaps() as Form, nCaps, False)
  EndIf
EndFunction

Function RemovePlayerCaps(Int nCaps) Global
  If nCaps > 0
    Game.GetPlayer().RemoveItem(Game.GetCaps() as Form, nCaps, False, None)
  EndIf
EndFunction
