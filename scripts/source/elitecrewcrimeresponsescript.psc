ScriptName EliteCrewCrimeResponseScript Extends CompanionCrimeResponseScript
{ ***REMINDER
all actors with this script MUST have their own "personal crime faction" faction that has a shared crime faction list of factions they consider "civilians" }

;-- Variables ---------------------------------------
Int GameTimerID_CrewAnger = 200 Const
Float TimerDur_CrewAngerTime = 6.0 Const

;-- Properties --------------------------------------
Group Autofill
  sq_crewscript Property SQ_Crew Auto Const mandatory
  Message Property EliteCrew_Angry_Message Auto Const mandatory
EndGroup

ActorValue Property CREW_Elite_IsAngry Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTimerGameTime(Int aiTimerID)
  Parent.OnTimerGameTime(aiTimerID)
  If aiTimerID == GameTimerID_CrewAnger
    Self.SetValue(CREW_Elite_IsAngry, 0.0)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Parent.OnActivate(akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && Self.GetValue(CREW_Elite_IsAngry) as Bool
    SQ_Crew.ShowTextReplacedMessage(Self as Actor, EliteCrew_Angry_Message, False, None, 0.0, 0.0)
  EndIf
EndEvent

Bool Function AmIAngry()
  Bool returnVal = Self.GetValue(CREW_Elite_IsAngry) == 1.0
  Return returnVal
EndFunction

Function CivilianKilled(Actor CivilianActor)
  AffinityEventOnKill.Send(CivilianActor as ObjectReference)
  Self.AutoDismiss()
EndFunction

Function AutoDismiss()
  If SQ_Crew.IsActiveEliteCrew(Self as Actor)
    Self.MakeAngry()
    SQ_Crew.SetEliteCrewInactive(Self as Actor, False)
  EndIf
EndFunction

Function MakeAngry()
  Self.SetValue(CREW_Elite_IsAngry, 1.0)
  Self.StartTimerGameTime(TimerDur_CrewAngerTime, GameTimerID_CrewAnger)
EndFunction
