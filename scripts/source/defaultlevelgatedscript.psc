ScriptName DefaultLevelGatedScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Mandatory_Properties
  GlobalVariable Property LevelGatedSentryGlobal Auto Const mandatory
  Race Property SentryBotRace Auto Const mandatory
  GlobalVariable Property LevelGatedDeathclawGlobal Auto Const mandatory
  Race Property DeathclawRace Auto Const mandatory
  GlobalVariable Property LevelGatedBehemothGlobal Auto Const mandatory
  Race Property SupermutantBehemothRace Auto Const mandatory
  GlobalVariable Property LevelGatedMirelurkQueenGlobal Auto Const mandatory
  Race Property MirelurkQueenRace Auto Const mandatory
  GlobalVariable Property LevelGatedGenericGlobal Auto Const mandatory
EndGroup

Group Optional_Properties
  Int Property LevelGateOverride = -1 Auto Const
  { If set then everything else is ignored, and if the player's level is equal to
	or greater than this Override Onload() this refrence will enable. }
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State WaitingForGate

  Event OnLoad()
    If LevelGateOverride == -1
      Actor selfActor = (Self as ObjectReference) as Actor
      If selfActor
        If selfActor.GetRace() == SentryBotRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedSentryGlobal.GetValue())
          Self.GoToState("Done")
          Self.Enable(False)
        ElseIf selfActor.GetRace() == DeathclawRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedDeathclawGlobal.GetValue())
          Self.GoToState("Done")
          Self.Enable(False)
        ElseIf selfActor.GetRace() == SupermutantBehemothRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedBehemothGlobal.GetValue())
          Self.GoToState("Done")
          Self.Enable(False)
        ElseIf selfActor.GetRace() == MirelurkQueenRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedMirelurkQueenGlobal.GetValue())
          Self.GoToState("Done")
          Self.Enable(False)
        ElseIf selfActor.GetRace() != SentryBotRace && selfActor.GetRace() != DeathclawRace && selfActor.GetRace() != SupermutantBehemothRace && selfActor.GetRace() != MirelurkQueenRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedGenericGlobal.GetValue())
          Self.GoToState("Done")
          Self.Enable(False)
        EndIf
      ElseIf Game.GetPlayer().GetLevel() as Float >= LevelGatedGenericGlobal.GetValue()
        Self.GoToState("Done")
        Self.Enable(False)
      EndIf
    ElseIf Game.GetPlayer().GetLevel() >= LevelGateOverride
      Self.GoToState("Done")
      Self.Enable(False)
    EndIf
  EndEvent
EndState
