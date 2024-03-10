ScriptName CRWQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CrewPosition Auto Const mandatory
ReferenceAlias Property CrewName Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory
Faction Property CurrentCrewFaction Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
Message Property HiredMessage Auto Const mandatory
Message Property FiredMessage Auto Const mandatory

;-- Functions ---------------------------------------

Function CrewHired()
  CrewPosition.ForceRefTo(CrewName.GetActorRef() as ObjectReference)
  CrewName.GetActorRef().SetFactionRank(CurrentCrewFaction, 0)
  CrewName.GetActorRef().SetFactionRank(PotentialCrewFaction, -1)
  CrewName.GetActorRef().SetFactionRank(AvailableCrewFaction, -1)
  HiredMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function CrewFired()
  CrewPosition.Clear()
  CrewName.GetActorRef().SetFactionRank(CurrentCrewFaction, -1)
  CrewName.GetActorRef().SetFactionRank(AvailableCrewFaction, 0)
  FiredMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction
