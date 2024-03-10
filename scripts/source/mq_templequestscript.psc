ScriptName MQ_TempleQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property StarbornTempleQuest Auto Const mandatory
LocationAlias Property TempleLocation01 Auto Const mandatory
LocationAlias Property TempleLocation02 Auto Const mandatory
LocationAlias Property TempleLocation03 Auto Const mandatory
LocationAlias Property TempleLocation04 Auto Const mandatory
LocationAlias Property TempleLocation05 Auto Const mandatory
LocationAlias Property TempleLocation06 Auto Const mandatory
LocationAlias Property TempleLocation07 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger01 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger02 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger03 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger04 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger05 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger06 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger07 Auto Const mandatory
Int Property StageAcquiredPower01 = 110 Auto Const
Int Property StageAcquiredPower02 = 120 Auto Const
Int Property StageAcquiredPower03 = 130 Auto Const
Int Property StageAcquiredPower04 = 140 Auto Const
Int Property StageAcquiredPower05 = 150 Auto Const
Int Property StageAcquiredPower06 = 160 Auto Const
Int Property StageAcquiredPower07 = 170 Auto Const
Int Property ArtifactNumber01 = 4 Auto Const
Int Property ArtifactNumber02 = 5 Auto Const
Int Property ArtifactNumber03 = 6 Auto Const
Int Property ArtifactNumber04 = 8 Auto Const
Int Property ArtifactNumber05 = 9 Auto Const
Int Property ArtifactNumber06 = 11 Auto Const
Int Property ArtifactNumber07 = 12 Auto Const
Int Property Artifact04Obj = 40 Auto Const
Int Property Artifact05Obj = 50 Auto Const
Int Property Artifact06Obj = 60 Auto Const
Int Property Artifact07Obj = 70 Auto Const
Int Property WaitForVladObj = 200 Auto Const
Int Property CheckOnVladObj = 210 Auto Const
Location Property StarstationTheEyeLocation Auto Const mandatory
Location Property CityNewAtlantisLodgeLocation Auto Const mandatory
GlobalVariable Property MQTempleQuest_HaveTempleObj Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckForTemples()
  Int PlayerHasNeededArtifact = 0
  PlayerHasNeededArtifact = (StarbornTempleQuest as starborntemplequestscript).CheckPlayerArtifactForPower()
  If PlayerHasNeededArtifact > -1
    Self.SetObjectiveDisplayed(WaitForVladObj, False, False)
    Self.SetObjectiveDisplayed(CheckOnVladObj, True, True)
  Else
    Self.SetObjectiveDisplayed(WaitForVladObj, True, True)
  EndIf
EndFunction

Function VladimirGivesObjective()
  Self.SetObjectiveDisplayed(CheckOnVladObj, False, False)
  Int myArtifactNumber = 0
  myArtifactNumber = (StarbornTempleQuest as starborntemplequestscript).CheckPlayerArtifactForPower()
  If myArtifactNumber == ArtifactNumber04
    Self.SetObjectiveDisplayed(Artifact04Obj, True, False)
  ElseIf myArtifactNumber == ArtifactNumber05
    Self.SetObjectiveDisplayed(Artifact05Obj, True, False)
  ElseIf myArtifactNumber == ArtifactNumber06
    Self.SetObjectiveDisplayed(Artifact06Obj, True, False)
  ElseIf myArtifactNumber == ArtifactNumber07
    Self.SetObjectiveDisplayed(Artifact07Obj, True, False)
  EndIf
  MQTempleQuest_HaveTempleObj.SetValueInt(1)
EndFunction

Event OnQuestInit()
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber01, TempleLocation01.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber02, TempleLocation02.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber03, TempleLocation03.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber04, TempleLocation04.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber05, TempleLocation05.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber06, TempleLocation06.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber07, TempleLocation07.GetLocation())
  Self.RegisterForCustomEvent((TemplePowerTrigger01.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger02.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger03.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger04.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger05.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger06.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger07.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
EndEvent

Event SBPowerCollectionActivatorScript.PowerAcquiredEvent(sbpowercollectionactivatorscript akSender, Var[] akArgs)
  If (akSender as ObjectReference == TemplePowerTrigger01.GetRef()) && Self.GetStageDone(StageAcquiredPower01) == False
    Self.SetStage(StageAcquiredPower01)
  ElseIf (akSender as ObjectReference == TemplePowerTrigger02.GetRef()) && Self.GetStageDone(StageAcquiredPower02) == False
    Self.SetStage(StageAcquiredPower02)
  ElseIf (akSender as ObjectReference == TemplePowerTrigger03.GetRef()) && Self.GetStageDone(StageAcquiredPower03) == False
    Self.SetStage(StageAcquiredPower03)
  ElseIf (akSender as ObjectReference == TemplePowerTrigger04.GetRef()) && Self.GetStageDone(StageAcquiredPower04) == False
    Self.SetStage(StageAcquiredPower04)
  ElseIf (akSender as ObjectReference == TemplePowerTrigger05.GetRef()) && Self.GetStageDone(StageAcquiredPower05) == False
    Self.SetStage(StageAcquiredPower05)
  ElseIf (akSender as ObjectReference == TemplePowerTrigger06.GetRef()) && Self.GetStageDone(StageAcquiredPower06) == False
    Self.SetStage(StageAcquiredPower06)
  ElseIf (akSender as ObjectReference == TemplePowerTrigger07.GetRef()) && Self.GetStageDone(StageAcquiredPower07) == False
    Self.SetStage(StageAcquiredPower07)
  EndIf
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer()
    If akNewLoc == StarstationTheEyeLocation || akNewLoc == CityNewAtlantisLodgeLocation
      Self.CheckForTemples()
    EndIf
  EndIf
EndEvent
