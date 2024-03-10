ScriptName RL067_ActivateEnableRobots Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor[] Property SpawnedRobot Auto mandatory
Bool Property DoEnable Auto mandatory
Bool Property DoAggro Auto mandatory
Faction Property PirateFaction Auto Const
Faction Property PirateEnemyFaction Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Utility.wait(2.0)
  Int index = 0
  While index < SpawnedRobot.Length
    If DoEnable == True
      SpawnedRobot[index].Enable(False)
    EndIf
    If DoAggro == True
      SpawnedRobot[index].SetValue(Game.GetAggressionAV(), 2.0)
      SpawnedRobot[index].RemoveFromFaction(PirateFaction)
      SpawnedRobot[index].AddToFaction(PirateEnemyFaction)
    EndIf
    index += 1
  EndWhile
EndEvent
