ScriptName MissionSabotageQuestScript Extends MissionQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group SabotageMissionData
  ReferenceAlias Property HoldingContainer Auto Const mandatory
  { alias where sabotage ref will be created }
  ReferenceAlias Property Device Auto Const mandatory
  { sabotage ref }
  ReferenceAlias Property DevicePlacementTrigger Auto Const mandatory
  { sabotage ref }
  ReferenceAlias Property PlacedDevice Auto Const mandatory
  { static version of the ARC device that is actually placed }
  MiscObject Property RIR04_Device Auto Const mandatory
  { base object to create planted device }
  Float Property CooldownDays = 2.0 Auto Const
  { how long before the same target location can be picked again? }
  ActorValue Property CooldownAV Auto Const mandatory
  { AV to use for cooldown timestamp }
EndGroup


;-- Functions ---------------------------------------

Function MissionAccepted(Bool bAccepted)
  If bAccepted
    Game.GetPlayer().AddItem(Device.GetRef() as Form, 1, False)
    DevicePlacementTrigger.TryToEnable()
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
  Game.GetPlayer().RemoveItem(Device.GetRef() as Form, 1, False, None)
  PlacedDevice.GetRef().MoveTo(PrimaryRef.GetRef(), 0.0, 0.0, 0.0, True, False)
  DevicePlacementTrigger.TryToDisable()
  Location targetLoc = TargetLocation.GetLocation()
  targetLoc.SetValue(CooldownAV, Utility.GetCurrentGameTime() + CooldownDays)
EndFunction
