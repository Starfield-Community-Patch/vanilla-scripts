ScriptName TrapElectricalPanelScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TrapElectricityDefaults
  Keyword Property TrapStartUnbrokenKeyword Auto Const mandatory
  { If the trap has this keyword it will start inactive and will need to be damaged to start }
  Keyword Property TrapElectricityCanArcToKeyword Auto Const mandatory
  { Keyword for object references that electricity will arc to }
  Keyword Property TrapRequiresPower Auto Const mandatory
  { Keyword for object references that electricity will arc to }
  Keyword Property ActorTypeRobot Auto Const mandatory
  { Keyword for robots, so electricity will arc to them }
  Keyword Property ActorTypeHuman Auto Const mandatory
  { Keyword for humans, so electricity will arc to them }
  Keyword Property ActorTypeCreature Auto Const mandatory
  { Keyword for humans, so electricity will arc to them }
  Keyword Property LinkCustom01 Auto Const mandatory
  { Keyword for link to point where projectile comes out }
  Float Property DamageToStartDestroyed = 1000.0 Auto Const
EndGroup

Group TrapElectricityArcData
  Spell Property ElectricitySpell Auto Const mandatory
  { Spell Cast by trap at each interval }
  Float Property fDistanceToArc = 12.0 Auto
  { Distance from arc start point that electricity will arc }
  Float Property arcMinTime = 1.899999976 Auto Const
  { Minimum base time between strikes }
  Float Property arcMaxTime = 2.5 Auto Const
  { Maximum base time between strikes }
EndGroup

Group TrapElectricityArcPanelSounds
  wwiseevent Property WwiseEvent_OBJ_ElectricalPanel_Destroyed Auto Const mandatory
  wwiseevent Property WwiseEvent_State_Switches_PowerOff Auto Const mandatory
  wwiseevent Property WwiseEvent_State_Switches_PowerOn Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ArcElectricityToTarget(ObjectReference target)
  If target
    ElectricitySpell.Cast(Self.GetLinkedRef(LinkCustom01), target)
  EndIf
EndFunction

ObjectReference Function FindTarget()
  ObjectReference ArcTarget = None
  ArcTarget = Self.FindRobotTarget()
  If ArcTarget == None
    ArcTarget = Self.FindHumanOrCreatureTarget()
  EndIf
  If ArcTarget == None
    ArcTarget = Self.FindStaticArcTarget()
  EndIf
  Return ArcTarget
EndFunction

ObjectReference Function FindRobotTarget()
{ Get a list of robots in range, find the ones in LOS, get the closest one of those. }
  ObjectReference RobotTarget = Self.ClosestTarget(Self.TargetsInLOS(Self.FindAllReferencesWithKeyword(ActorTypeRobot as Form, fDistanceToArc)))
  Return RobotTarget
EndFunction

ObjectReference Function FindHumanOrCreatureTarget()
{ Get a list of creatures and humans in range, find the ones in LOS, get the closest one of those. }
  ObjectReference CreatureTarget = Self.ClosestTarget(Self.TargetsInLOS(Self.FindAllReferencesWithKeyword(ActorTypeCreature as Form, fDistanceToArc)))
  ObjectReference HumanTarget = Self.ClosestTarget(Self.TargetsInLOS(Self.FindAllReferencesWithKeyword(ActorTypeHuman as Form, fDistanceToArc)))
  ObjectReference target = None
  If HumanTarget as Bool && CreatureTarget as Bool
    If Self.GetDistance(HumanTarget) < Self.GetDistance(CreatureTarget)
      target = HumanTarget
    Else
      target = CreatureTarget
    EndIf
  ElseIf HumanTarget
    target = HumanTarget
  ElseIf CreatureTarget
    target = CreatureTarget
  EndIf
  Return target
EndFunction

ObjectReference Function FindStaticArcTarget()
  ObjectReference[] ArcTargets = Self.TargetsInLOS(Self.FindAllReferencesWithKeyword(TrapElectricityCanArcToKeyword as Form, fDistanceToArc))
  If ArcTargets.Length > 0
    ObjectReference ArcTarget = ArcTargets[Utility.RandomInt(0, ArcTargets.Length - 1)]
    Return ArcTarget
  Else
    Return None
  EndIf
EndFunction

ObjectReference[] Function TargetsInLOS(ObjectReference[] targets)
{ Returns an array of all targets from the passed in array that are in Line Of Sight }
  If targets.Length > 0
    ObjectReference[] TargetsInLOS = new ObjectReference[0]
    Int I = 0
    While I < targets.Length
      If Self.HasDirectLOS(targets[I], "", "")
        TargetsInLOS.add(targets[I], 1)
      EndIf
      I += 1
    EndWhile
    Return TargetsInLOS
  Else
    Return None
  EndIf
EndFunction

ObjectReference Function ClosestTarget(ObjectReference[] targets)
{ Returns the closest target from an array of targets }
  If targets.Length > 0
    ObjectReference currentTarget = targets[0]
    Float currentTargetDistance = Self.GetDistance(currentTarget)
    Int I = 1
    While I < targets.Length
      Float nextTargetDistance = Self.GetDistance(targets[I])
      If nextTargetDistance < currentTargetDistance
        currentTarget = targets[I]
        currentTargetDistance = nextTargetDistance
      EndIf
      I += 1
    EndWhile
    Return currentTarget
  Else
    Return None
  EndIf
EndFunction

;-- State -------------------------------------------
State Active

  Event OnPowerOff()
    WwiseEvent_State_Switches_PowerOff.Play(Self as ObjectReference, None, None)
    If Self.GetLinkedRef(None).HasKeyword(TrapRequiresPower)
      Self.GotoState("Inactive")
      Self.CancelTimer(0)
    EndIf
  EndEvent

  Event OnTimer(Int aiTimerID)
    Self.ArcElectricityToTarget(Self.FindTarget())
    Self.StartTimer(Utility.RandomFloat(arcMinTime, arcMaxTime), 0)
  EndEvent

  Event OnUnload()
    Self.GotoState("Inactive")
  EndEvent

  Event OnBeginState(String asOldState)
    Self.ArcElectricityToTarget(Self.FindTarget())
    Self.StartTimer(Utility.RandomFloat(arcMinTime, arcMaxTime), 0)
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Inactive

  Event OnDestroyed(ObjectReference akDestroyer)
    WwiseEvent_OBJ_ElectricalPanel_Destroyed.Play(Self as ObjectReference, None, None)
    If Self.GetLinkedRef(None).HasKeyword(TrapRequiresPower)
      If Self.IsPowered()
        Self.GotoState("Active")
      EndIf
    Else
      Self.GotoState("Active")
    EndIf
  EndEvent

  Event OnPowerOn(ObjectReference akPowerGenerator)
    WwiseEvent_State_Switches_PowerOn.Play(Self as ObjectReference, None, None)
    If Self.IsDestroyed() && Self.GetLinkedRef(None).HasKeyword(TrapRequiresPower)
      Self.GotoState("Active")
    EndIf
  EndEvent

  Event OnCellLoad()
    If !Self.GetLinkedRef(None).HasKeyword(TrapStartUnbrokenKeyword)
      Self.DamageObject(DamageToStartDestroyed)
    EndIf
    WwiseEvent_State_Switches_PowerOn.Play(Self as ObjectReference, None, None)
  EndEvent
EndState
