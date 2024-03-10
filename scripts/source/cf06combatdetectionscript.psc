ScriptName CF06CombatDetectionScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool stageIsSet = False
Int stageToSet = 195

;-- Properties --------------------------------------
Quest Property CF06 Auto Const
Location Property LC0939Location Auto Const
Faction Property RobotSecurityFaction Auto Const
Faction Property RobotJanitorFaction Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Actor player = Game.GetPlayer()
  Self.RegisterForRemoteEvent(player as ScriptObject, "OnKill")
EndEvent

Event OnCellDetach()
  If !stageIsSet
    Self.UnregisterForKillEvents()
  EndIf
EndEvent

Event Actor.OnKill(Actor akSender, ObjectReference akVictim)
  If akSender.GetCurrentLocation() == LC0939Location
    Actor victimActor = akVictim as Actor
    If victimActor != None
      Bool victimIsInRobotSecurityFaction = victimActor.IsInFaction(RobotSecurityFaction)
      Bool victimIsInRobotJanitorFaction = False
      If !victimIsInRobotSecurityFaction && !victimIsInRobotJanitorFaction
        Self.SetCombatStage()
        Self.UnregisterForKillEvents()
      EndIf
    EndIf
  EndIf
EndEvent

Function SetCombatStage()
  CF06.SetStage(stageToSet)
  stageIsSet = True
EndFunction

Function UnregisterForKillEvents()
  Actor player = Game.GetPlayer()
  Self.UnregisterForRemoteEvent(player as ScriptObject, "OnKill")
EndFunction
