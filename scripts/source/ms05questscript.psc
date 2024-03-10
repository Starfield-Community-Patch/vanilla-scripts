ScriptName MS05QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CompleteBountyStage = 510 Auto Const
Int Property CompletePassengerStage = 520 Auto Const
missionparentscript Property MissionParent Auto Const mandatory

;-- Functions ---------------------------------------

Function StartMissions()
  Actor myPlayer = Game.GetPlayer()
  Self.RegisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionCompleted")
EndFunction

Function MissionsCompleted()
  Self.UnregisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionCompleted")
EndFunction

Event MissionParentScript.MissionCompleted(missionparentscript akSender, Var[] akArgs)
  missionquestscript completedQuest = akArgs[0] as missionquestscript
  Bool missionFailed = akArgs[1] as Bool
  If missionFailed == False
    If completedQuest as Bool && completedQuest.MissionType == 2
      Self.SetStage(CompletePassengerStage)
    ElseIf completedQuest as Bool && completedQuest.MissionType == 9
      Self.SetStage(CompleteBountyStage)
    EndIf
  EndIf
EndEvent
