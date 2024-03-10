ScriptName DialogueCydoniaDetonationQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Cell Property CityCydoniaMainLevel Auto Const mandatory
Cell Property CityCydoniaMainLevel02 Auto Const mandatory
GlobalVariable Property CY_DetonationEndOfDay Auto Const mandatory
GlobalVariable Property CY_DetonationCount Auto Const mandatory
LocationAlias Property Cydonia Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Announcer_Countdown Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Announcer_LastCall Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Concluded Auto Const mandatory
Scene Property DialogueCydonia_Detonation_Concluded_LastCall Auto Const mandatory
wwiseevent Property AMB_Cydonia_Fracking_Explosion_FirstEncounter Auto Const mandatory
wwiseevent Property AMB_Cydonia_Fracking_Explosion Auto Const mandatory
wwiseevent Property AMB_Cydonia_Fracking_Klaxon_TriggerEchos Auto Const mandatory
wwiseevent Property AMB_Cydonia_EXT_Fracking_Explosion_NoOcc Auto Const mandatory
wwiseevent Property AMB_Cydonia_EXT_Fracking_StructureRumbleTriggerEchos Auto Const mandatory
ReferenceAlias Property DetonationSoundMarkerFirstTime Auto Const mandatory
ReferenceAlias Property DetonationSoundMarker Auto Const mandatory
ReferenceAlias Property DetonationSoundMarkerInt02 Auto Const mandatory
ReferenceAlias Property DetonationSoundMarkerExt Auto Const mandatory
RefCollectionAlias Property Klaxons Auto Const mandatory
Int Property KlaxonTimerID = 1 Auto Const
Float Property KlaxonTimerLength = 3.0 Auto Const
Int Property DetonationTimerID = 2 Auto Const
Float Property DetonationTimerLength = 8.0 Auto Const
Int Property EndQuestTimerID = 3 Auto Const
Float Property EndQuestTimerLength = 3.0 Auto Const
Float Property DetonationShakeLength = 4.0 Auto Const
Int Property QuestDoneStage = 1000 Auto Const

;-- Functions ---------------------------------------

Function PlayKlaxons()
  Int I = 0
  Int iCount = Klaxons.GetCount()
  While I < iCount
    ObjectReference myKlaxon = Klaxons.GetAt(I)
    myKlaxon.PlayAnimation("Play01")
    I += 1
  EndWhile
  If CY_DetonationCount.GetValue() < 1.0
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerFirstTime.GetRef(), None, None)
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerInt02.GetRef(), None, None)
  Else
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarker.GetRef(), None, None)
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerInt02.GetRef(), None, None)
    AMB_Cydonia_Fracking_Klaxon_TriggerEchos.Play(DetonationSoundMarkerExt.GetRef(), None, None)
  EndIf
  Self.StartTimer(KlaxonTimerLength, KlaxonTimerID)
EndFunction

Function PlaySequence()
  Actor myPlayer = Game.GetPlayer()
  If Game.GetLocalTime() >= CY_DetonationEndOfDay.GetValue() - 2.0 && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue()
    If myPlayer.IsInLocation(Cydonia.GetLocation())
      DialogueCydonia_Detonation_Announcer_LastCall.Start()
    Else
      Self.SetStage(QuestDoneStage)
    EndIf
  ElseIf myPlayer.IsInLocation(Cydonia.GetLocation())
    DialogueCydonia_Detonation_Announcer_Countdown.Start()
  Else
    Self.SetStage(QuestDoneStage)
  EndIf
EndFunction

Function Shake()
  Game.ShakeCamera(None, 0.200000003, DetonationShakeLength)
  Game.ShakeController(0.300000012, 0.150000006, DetonationShakeLength)
  Utility.Wait(3.0)
  Game.ShakeCamera(None, 0.050000001, DetonationShakeLength)
  Game.ShakeController(0.150000006, 0.0, DetonationShakeLength)
EndFunction

Function PlayDetonationFX()
  If CY_DetonationCount.GetValue() < 1.0
    AMB_Cydonia_Fracking_Explosion_FirstEncounter.Play(DetonationSoundMarkerFirstTime.GetRef(), None, None)
  Else
    AMB_Cydonia_Fracking_Explosion.Play(DetonationSoundMarker.GetRef(), None, None)
  EndIf
  Self.DetonationTimer()
  Self.Shake()
EndFunction

Function PlayDetonationFXInt02()
  AMB_Cydonia_Fracking_Explosion.Play(DetonationSoundMarkerInt02.GetRef(), None, None)
  Self.DetonationTimer()
  Self.Shake()
EndFunction

Function PlayDetonationFXEXT()
  AMB_Cydonia_EXT_Fracking_Explosion_NoOcc.Play(DetonationSoundMarkerExt.GetRef(), None, None)
  AMB_Cydonia_EXT_Fracking_StructureRumbleTriggerEchos.Play(Game.GetPlayer() as ObjectReference, None, None)
  Self.DetonationTimer()
  Self.Shake()
EndFunction

Function DetonationTimer()
  Self.StartTimer(DetonationTimerLength, DetonationTimerID)
EndFunction

Function ConcludeSequence()
  If Game.GetLocalTime() >= CY_DetonationEndOfDay.GetValue() - 1.0 && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue() + 1.0
    DialogueCydonia_Detonation_Concluded_LastCall.Start()
  Else
    DialogueCydonia_Detonation_Concluded.Start()
  EndIf
EndFunction

Function DelayQuestEndForLastCall()
  Self.StartTimerGameTime(EndQuestTimerLength, EndQuestTimerID)
EndFunction

Function EndKlaxons()
  Int I = 0
  Int iCount = Klaxons.GetCount()
  While I < iCount
    ObjectReference myKlaxon = Klaxons.GetAt(I)
    myKlaxon.PlayAnimation("Play02")
    I += 1
  EndWhile
EndFunction

Function SelectCorrectDetonation()
  Actor myPlayer = Game.GetPlayer()
  If myPlayer.IsInLocation(Cydonia.GetLocation())
    If myPlayer.IsInInterior()
      Cell myCell = myPlayer.GetParentCell()
      If myCell == CityCydoniaMainLevel
        Self.PlayDetonationFX()
      ElseIf myCell == CityCydoniaMainLevel02
        Self.PlayDetonationFXInt02()
      Else
        Self.SetStage(QuestDoneStage)
      EndIf
    Else
      Self.PlayDetonationFXEXT()
    EndIf
  Else
    Self.SetStage(QuestDoneStage)
  EndIf
EndFunction

Function SelectCorrectConclusion()
  Actor myPlayer = Game.GetPlayer()
  If myPlayer.IsInLocation(Cydonia.GetLocation())
    Self.ConcludeSequence()
  Else
    Self.SetStage(QuestDoneStage)
  EndIf
EndFunction

Event OnQuestInit()
  Self.PlayKlaxons()
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == KlaxonTimerID
    Self.PlaySequence()
  ElseIf aiTimerID == DetonationTimerID
    Self.SelectCorrectConclusion()
  EndIf
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == EndQuestTimerID
    Self.Stop()
  EndIf
EndEvent
