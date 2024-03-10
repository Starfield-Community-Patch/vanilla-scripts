ScriptName RAD03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property EndQuestStage = 1000 Auto Const
missionparentscript Property MissionParent Auto Const mandatory
missionquestscript[] Property CargoMissions Auto Const
missionparentscript Property MB_Parent Auto Const mandatory
LocationAlias Property Alias_MissionBoardLoc Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor myPlayer = Game.GetPlayer()
  Self.RegisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted")
EndEvent

Event OnQuestStarted()
  If Self.CheckForActiveCargoMissions()
    Self.SetStage(EndQuestStage)
  Else
    Location missionLoc = Alias_MissionBoardLoc.GetLocation()
    MB_Parent.ResetMissions(True, False, missionLoc, True)
  EndIf
EndEvent

Bool Function CheckForActiveCargoMissions()
  Bool foundActiveMission = False
  Int I = 0
  While I < CargoMissions.Length && foundActiveMission == False
    missionquestscript theMission = CargoMissions[I]
    If theMission.PlayerAcceptedQuest && theMission.PlayerCompletedQuest == False && theMission.PlayerFailedQuest == False
      foundActiveMission = True
    EndIf
    I += 1
  EndWhile
  Return foundActiveMission
EndFunction

Event MissionParentScript.MissionAccepted(missionparentscript akSender, Var[] akArgs)
  missionquestscript acceptedQuest = akArgs[0] as missionquestscript
  If acceptedQuest as Bool && acceptedQuest.MissionType == 1
    Self.UnregisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted")
    Self.SetStage(EndQuestStage)
  EndIf
EndEvent
