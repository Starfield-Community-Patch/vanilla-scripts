ScriptName Crew_EliteCrewQuestScript Extends Crew_RecruitQuestScript

;-- Functions ---------------------------------------

Event OnQuestInit()
  CrewMemberRef = Alias_CrewMember.GetActorReference()
  If Game.GetPlayer().HasPerk(Trait_Taskmaster)
    Self.SetCostMultAndUpdateCost(CostMult_Taskmaster)
  Else
    Self.UpdateCost()
  EndIf
EndEvent

Function PickupSceneEnded()
  SQ_Crew.SetEliteCrewActive(CrewMemberRef)
EndFunction

Function DismissSceneEnded()
  SQ_Crew.SetEliteCrewInActive(CrewMemberRef, False)
EndFunction

Function WaitSceneEnded()
  SQ_Followers.CommandWait(CrewMemberRef, None)
EndFunction

Function FollowSceneEnded()
  SQ_Followers.CommandFollow(CrewMemberRef)
EndFunction

Function GiveItemSceneEnded()
  (CrewMemberRef as com_crew_giveitemactorscript).GiveItems()
EndFunction

Function StartBackstoryTimer()
  Float expiry = Utility.ExpiryDay(SQ_Crew.Crew_Elite_BackstoryFollowup_CooldownDays.GetValue(), None, -1.0, -1.0)
  CrewMemberRef.SetValue(SQ_Crew.Crew_Elite_BackstoryFollowup_Day, expiry)
EndFunction
