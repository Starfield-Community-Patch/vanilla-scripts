ScriptName RI_CrimeTrackingPlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property RadiantLocation Auto Const mandatory
Int Property iStartTrackingStage Auto Const mandatory
Int Property iStopTrackingStage Auto Const mandatory
Int Property iPreReqTrackingStage Auto Const mandatory
Keyword Property ActorTypeHuman Auto Const mandatory
Perk Property RI_BountyTrackingPerk Auto Const mandatory

;-- Functions ---------------------------------------

Event OnKill(ObjectReference akVictim)
  Quest MyQuest = Self.GetOwningQuest()
  If MyQuest.GetStageDone(iStartTrackingStage)
    If akVictim.GetCurrentLocation() == RadiantLocation.GetLocation() && akVictim.HasKeyword(ActorTypeHuman)
      (MyQuest as ri_crimetrackingquestscript).iBodyCount = (MyQuest as ri_crimetrackingquestscript).iBodyCount + 1
    EndIf
  EndIf
EndEvent

Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, Int aeCrimeType)
  Quest MyQuest = Self.GetOwningQuest()
  If MyQuest.GetStageDone(iStartTrackingStage)
    If akLocation == RadiantLocation.GetLocation()
      (MyQuest as ri_crimetrackingquestscript).iTimesArrested = (MyQuest as ri_crimetrackingquestscript).iTimesArrested + 1
      If aeCrimeType <= 1
        (MyQuest as ri_crimetrackingquestscript).iTheftArrest = (MyQuest as ri_crimetrackingquestscript).iTheftArrest + 1
      ElseIf aeCrimeType == 3
        (MyQuest as ri_crimetrackingquestscript).iAttemptedMurderArrest = (MyQuest as ri_crimetrackingquestscript).iAttemptedMurderArrest + 1
      ElseIf aeCrimeType == 4
        (MyQuest as ri_crimetrackingquestscript).iMurderArrest = (MyQuest as ri_crimetrackingquestscript).iMurderArrest + 1
      EndIf
    EndIf
  EndIf
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Location LocationToCheck = RadiantLocation.GetLocation()
  Actor PlayerRef = Game.GetPlayer()
  Quest MyQuest = Self.GetOwningQuest()
  If MyQuest.GetStageDone(iPreReqTrackingStage)
    If akNewLoc == LocationToCheck
      Game.GetPlayer().AddPerk(RI_BountyTrackingPerk, False)
    EndIf
    If akOldLoc == LocationToCheck
      PlayerRef.RemovePerk(RI_BountyTrackingPerk)
    EndIf
  EndIf
EndEvent
