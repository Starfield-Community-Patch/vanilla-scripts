ScriptName Crew_RecruitQuestScript Extends Quest hidden
{ Used by extending scripts to set hire prices and hired states on actors.
***This script not intended to be used directly. Extending scripts must set CrewMemberRef before calling these functions.*** }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  GlobalVariable Property Crew_RecruitCost_TextReplacementValue Auto Const mandatory
  { this will hold the current value of what the player needs to pay to recruit for text replacement and condition functions
***IMPORTANT!***: Also add this to Text Display Variables on Quest Data Tab }
  ActorValue Property Crew_HireSpeechChallengeAttempted Auto Const mandatory
EndGroup

Group Properties
  ReferenceAlias Property Alias_CrewMember Auto Const mandatory
  ReferenceAlias Property playerShip Auto Const
  Perk Property Trait_Taskmaster Auto Const
  Float Property CostMult_Taskmaster = 2.0 Auto Const
EndGroup

Actor Property CrewMemberRef Auto hidden

;-- Functions ---------------------------------------

Function SpeechChallengeAttempted()
  If CrewMemberRef
    CrewMemberRef.SetValue(Crew_HireSpeechChallengeAttempted, 1.0)
  EndIf
EndFunction

Function UpdateCost()
  If CrewMemberRef
    Int cost = SQ_Crew.GetRecruitCost(CrewMemberRef)
    Crew_RecruitCost_TextReplacementValue.SetValue(cost as Float)
    Self.UpdateCurrentInstanceGlobal(Crew_RecruitCost_TextReplacementValue)
  EndIf
EndFunction

Function SetCostMultAndUpdateCost(Float Mult)
  If CrewMemberRef
    SQ_Crew.SetRecruitCostMult(CrewMemberRef, Mult)
    Self.UpdateCost()
  EndIf
EndFunction

Function Recruited()
  If CrewMemberRef
    If CrewMemberRef.IsInFaction(SQ_Crew.AvailableCrewFaction) == False
      Int cost = SQ_Crew.GetRecruitCost(CrewMemberRef)
      MiscObject credits = Game.GetCredits()
      Game.GetPlayer().RemoveItem(credits as Form, cost, False, None)
    EndIf
    SQ_Crew.SetRoleAvailable(CrewMemberRef, True)
    CrewMemberRef.ShowCrewAssign(True)
  EndIf
EndFunction

Function RecruitedUnasssigned()
  spaceshipreference ShipRef = playerShip.GetShipRef()
  ShipRef.AssignCrew(CrewMemberRef)
  ShipRef.UnassignCrew(CrewMemberRef)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
