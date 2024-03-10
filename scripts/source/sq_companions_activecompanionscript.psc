ScriptName SQ_Companions_ActiveCompanionScript Extends ReferenceAlias
{ script for whatever companion is currently in ActiveCompanion alias }

;-- Variables ---------------------------------------
Int Skill_LeadershipRecoveryTimerID = 1 Const
Int TimerID_TravelAffinityCoolDown = 2 Const
Bool TravelAffinityCoolDownDone = True

;-- Properties --------------------------------------
Group Perks
  Perk Property Skill_Leadership Auto Const mandatory
  Float Property Skill_Leadership_Rank4_CompanionRecoverChance = 0.5 Auto Const
  { chance (0.0 - 1.0) to recover from bleedout (once per combat) }
  Bool Property Skill_Leadership_HasRecovered Auto hidden
  { set to true when companion recovers - set back to false when combat ends }
  Quest Property PlayerSkills Auto Const mandatory
  { used to check stage for Leadership rank 4 }
  Int Property Skill_Leadership_Rank4Stage = 1504 Auto Const
  { stage to check for Leadership rank 4, since we don't have a papyrus function for that }
  Float Property Skill_LeadershipRecoveryDelay = 10.0 Auto Const
  { seconds between going into bleedout and recovering }
EndGroup

Group Travel_Affinity
  GlobalVariable Property COM_AffinityTravelBonus_PreMQ Auto Const mandatory
  { Autofill }
  GlobalVariable Property COM_AffinityTravelBonus_PostMQ Auto Const mandatory
  { Autofill }
  GlobalVariable Property COM_AffinityTravelCoolDown Auto Const mandatory
  { Autofill }
  Quest Property MQ302B Auto Const mandatory
  { Autofill }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  Skill_Leadership_HasRecovered = False
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == Skill_LeadershipRecoveryTimerID
    Actor actorRef = Self.GetActorRef()
    If actorRef.IsBleedingOut()
      actorRef.RestoreValue(Game.GetHealthAV(), 999.0)
      Utility.wait(5.0)
    EndIf
    Self.gotoState("recoveryAllowed")
  ElseIf aiTimerID == TimerID_TravelAffinityCoolDown
    TravelAffinityCoolDownDone = True
  EndIf
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Self.AwardAffinityTravelBonus()
EndEvent

Function AwardAffinityTravelBonus()
  If TravelAffinityCoolDownDone
    Int amountToAdd = 0
    If MQ302B.IsCompleted()
      amountToAdd = COM_AffinityTravelBonus_PostMQ.GetValueInt()
    Else
      amountToAdd = COM_AffinityTravelBonus_PreMQ.GetValueInt()
    EndIf
    (Self.GetActorReference() as companionactorscript).AddAffinity(amountToAdd)
    Self.StartTimer_AffinityTravelCoolDown(False)
  EndIf
EndFunction

Function StartTimer_AffinityTravelCoolDown(Bool ExpireTimer)
  TravelAffinityCoolDownDone = False
  Float duration = 0.0
  If ExpireTimer == False
    duration = COM_AffinityTravelCoolDown.GetValue()
  EndIf
  Self.StartTimer(duration, TimerID_TravelAffinityCoolDown)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction

;-- State -------------------------------------------
State noRecovery
EndState

;-- State -------------------------------------------
Auto State recoveryAllowed

  Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
    If aeCombatState == 0
      Skill_Leadership_HasRecovered = False
    EndIf
  EndEvent

  Event OnEnterBleedout()
    If Skill_Leadership_HasRecovered == False
      If PlayerSkills.GetStageDone(Skill_Leadership_Rank4Stage)
        Actor actorRef = Self.GetActorRef()
        Float recoverRoll = Utility.RandomFloat(0.0, 1.0)
        If recoverRoll <= Skill_Leadership_Rank4_CompanionRecoverChance
          Skill_Leadership_HasRecovered = True
          Self.gotoState("noRecovery")
          Self.StartTimer(Skill_LeadershipRecoveryDelay, Skill_LeadershipRecoveryTimerID)
        EndIf
      EndIf
    EndIf
  EndEvent
EndState
