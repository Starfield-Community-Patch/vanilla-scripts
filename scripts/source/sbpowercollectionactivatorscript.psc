ScriptName SBPowerCollectionActivatorScript Extends ObjectReference
{ This is on the spherical activator in the very center of the rings.
It gets enabled when the puzzle is solved. 
It handles the FX sequence for the player getting the appropriate power (or ranks it up if they already have the power) if they have the necessary artifact, gives xp, and a permanent health boost. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group effectsData
  ImageSpaceModifier Property MQ207CShiftFadeHoldImod Auto Const mandatory
  ImageSpaceModifier Property MQ207CShiftFadeInImod Auto Const mandatory
  Explosion Property PowerExplosion Auto Const mandatory
  EffectShader Property StarbornPuzzle_PlayerFXS Auto Const mandatory
EndGroup

Group soundData
  wwiseevent Property wPowerAbsorbFXEvent Auto Const mandatory
  MusicType Property mPowerAbsorbStinger Auto Const mandatory
EndGroup

Group keywords
  Keyword Property SBExplosionMarkerKeyword Auto Const mandatory
  Keyword Property SBRingsPuzzleKeyword Auto Const mandatory
  Keyword Property SBPlayerMoveToMarkerKeyword Auto Const mandatory
  Keyword Property BQ01_Keyword_BarrettTempleMarkerLink Auto Const
  Keyword Property BQ01_Keyword_BarrettPowerMarkerLink Auto Const
  Keyword Property BQ01_Keyword_TempleLocation Auto Const
  Keyword Property SBTempleCompanionMarkerLinkKeyword Auto Const
  Keyword Property SBAbsorbPowerFurnKeyword Auto Const mandatory
EndGroup

Group specialHandling
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ReferenceAlias Property Barrett Auto Const
  Quest Property BarrettQuest Auto Const
  Int Property BarrettQuestTempleStagePrereq = 8500 Auto Const
  Int Property BarrettQuestTempleStage = 8501 Auto Const
EndGroup

Group powerReward
  Idle Property IdlePowerUp_Start Auto Const mandatory
  Idle Property IdlePowerUp_Stop Auto Const mandatory
  Message Property PlayerHealthIncreaseMessage Auto Const mandatory
  GlobalVariable Property StarbornPuzzleXP Auto Const mandatory
  ActorValue Property HealthAV Auto Const mandatory
  GlobalVariable Property SBPowerHealthBonus Auto Const mandatory
  { how much is added to the player's health for solving the puzzle }
  Spell Property RankUpPerk Auto
  String Property sVisionBink Auto
  wwiseevent Property WwiseEvent_AMBArtifactVision Auto
EndGroup

Group quests
  Quest Property QuestToCheck Auto Const
  { optional - if provided and StageToSet > -1, this quest stage will be set when the power sequence is done }
  Int Property StageToSet = -1 Auto Const
EndGroup


;-- Functions ---------------------------------------

Function PlayerPowerSequence()
  Bool bBarrettQuestActive = False
  If Self.GetCurrentLocation().HasKeyword(BQ01_Keyword_TempleLocation)
    bBarrettQuestActive = True
  EndIf
  ObjectReference puzzleRef = Self.GetLinkedRef(SBRingsPuzzleKeyword)
  Actor playerRef = Game.GetPlayer()
  inputenablelayer myLayer = inputenablelayer.Create()
  myLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
  ObjectReference absorbPowerFurnitureRef = Self.GetLinkedRef(SBAbsorbPowerFurnKeyword)
  If absorbPowerFurnitureRef
    absorbPowerFurnitureRef.Activate(playerRef as ObjectReference, False)
  EndIf
  StarbornPuzzle_PlayerFXS.Play(playerRef as ObjectReference, -1.0)
  Int instancePowerFX = wPowerAbsorbFXEvent.Play(playerRef as ObjectReference, None, None)
  puzzleRef.PlayAnimationAndWait("Stage1", "Stage2")
  WwiseEvent_AMBArtifactVision.Play(playerRef as ObjectReference, None, None)
  Game.PlayBinkNoWait(sVisionBink, False, False, False, True, False, True)
  playerRef.MoveTo(Self.GetLinkedRef(SBPlayerMoveToMarkerKeyword), 0.0, 0.0, 0.0, True, False)
  StarbornPuzzle_PlayerFXS.Stop(playerRef as ObjectReference)
  If bBarrettQuestActive
    Barrett.TryToMoveTo(Self.GetLinkedRef(BQ01_Keyword_BarrettTempleMarkerLink))
  Else
    SQ_Followers.TeleportFollowers(Self.GetLinkedRef(SBTempleCompanionMarkerLinkKeyword), None, True, True, False, False, False)
  EndIf
  playerRef.WaitFor3DLoad()
  Utility.Wait(3.0)
  myLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True)
  Self.PlayerReceivePower()
  If bBarrettQuestActive
    BarrettQuest.SetStage(BarrettQuestTempleStage)
  EndIf
  If QuestToCheck as Bool && StageToSet > -1
    QuestToCheck.SetStage(StageToSet)
  EndIf
EndFunction

Function PlayerReceivePower()
  Actor playerRef = Game.GetPlayer()
  Int iXPIncrease = StarbornPuzzleXP.GetValueInt()
  RankUpPerk.Cast(playerRef as ObjectReference, playerRef as ObjectReference)
  Utility.Wait(0.200000003)
  playerRef.ModValue(HealthAV, SBPowerHealthBonus.GetValueInt() as Float)
  Utility.Wait(0.200000003)
  Game.RewardPlayerXP(iXPIncrease, False)
  Utility.Wait(1.0)
  Self.SendCustomEvent("sbpowercollectionactivatorscript_PowerAcquiredEvent", None)
EndFunction

Function UpdatePowerProperties(Spell newRankUpPerk, String newVisionBink, wwiseevent newArtifactVision)
  RankUpPerk = newRankUpPerk
  sVisionBink = newVisionBink
  WwiseEvent_AMBArtifactVision = newArtifactVision
EndFunction

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnTriggerEnter(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.GotoState("HasBeenTriggered")
      Self.PlayerPowerSequence()
    EndIf
  EndEvent
EndState
