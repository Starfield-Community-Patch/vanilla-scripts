ScriptName MissionPlantEvidenceQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group PlantEvidenceMissionData
  ReferenceAlias Property HoldingContainer Auto Const mandatory
  { alias where data disk ref will be created }
  ReferenceAlias Property Evidence Auto Const mandatory
  { evidence to plant }
  Float Property CooldownDays = 2.0 Auto Const
  { how long before the same target location can be picked again? }
  ActorValue Property CooldownAV Auto Const mandatory
  { AV to use for cooldown timestamp }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  If bAccepted
    Game.GetPlayer().AddItem(Evidence.GetRef() as Form, 1, False)
  EndIf
  Parent.MissionAccepted(bAccepted)
EndFunction

Function HandleOnQuestRejected()
  Self.CleanupMission()
  Self.MissionFailed()
EndFunction

Function MissionComplete()
  Self.CleanupMission()
  Parent.MissionComplete()
EndFunction

Function CleanupMission()
  PrimaryRef.GetRef().RemoveItem(Evidence.GetRef() as Form, 1, False, None)
  Location targetLoc = TargetLocation.GetLocation()
  targetLoc.SetValue(CooldownAV, Utility.GetCurrentGameTime() + CooldownDays)
EndFunction
