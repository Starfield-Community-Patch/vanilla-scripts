ScriptName MQ403QuestScript Extends Quest

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
LocationAlias Property TempleLocation08 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger01 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger02 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger03 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger04 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger05 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger06 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger07 Auto Const mandatory
ReferenceAlias Property TemplePowerTrigger08 Auto Const mandatory
Int Property StageAcquiredPower01 = 210 Auto Const
Int Property StageAcquiredPower02 = 220 Auto Const
Int Property StageAcquiredPower03 = 230 Auto Const
Int Property StageAcquiredPower04 = 240 Auto Const
Int Property StageAcquiredPower05 = 250 Auto Const
Int Property StageAcquiredPower06 = 260 Auto Const
Int Property StageAcquiredPower07 = 270 Auto Const
Int Property StageAcquiredPower08 = 280 Auto Const
Int Property ArtifactNumber01 = 0 Auto Const
Int Property ArtifactNumber02 = 4 Auto Const
Int Property ArtifactNumber03 = 5 Auto Const
Int Property ArtifactNumber04 = 6 Auto Const
Int Property ArtifactNumber05 = 8 Auto Const
Int Property ArtifactNumber06 = 9 Auto Const
Int Property ArtifactNumber07 = 11 Auto Const
Int Property ArtifactNumber08 = 12 Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber01, TempleLocation01.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber02, TempleLocation02.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber03, TempleLocation03.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber04, TempleLocation04.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber05, TempleLocation05.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber06, TempleLocation06.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber07, TempleLocation07.GetLocation())
  (StarbornTempleQuest as starborntemplequestscript).SetArtifactAndPower(ArtifactNumber08, TempleLocation08.GetLocation())
  Self.RegisterForCustomEvent((TemplePowerTrigger01.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger02.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger03.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger04.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger05.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger06.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger07.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
  Self.RegisterForCustomEvent((TemplePowerTrigger08.GetRef() as sbpowercollectionactivatorscript) as ScriptObject, "sbpowercollectionactivatorscript_PowerAcquiredEvent")
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
  ElseIf (akSender as ObjectReference == TemplePowerTrigger08.GetRef()) && Self.GetStageDone(StageAcquiredPower08) == False
    Self.SetStage(StageAcquiredPower08)
  EndIf
EndEvent
