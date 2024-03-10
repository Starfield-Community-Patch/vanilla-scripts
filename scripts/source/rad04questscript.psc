ScriptName RAD04QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property EndQuestStage = 1000 Auto Const
missionparentscript Property MissionParent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor myPlayer = Game.GetPlayer()
  Self.RegisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted")
EndEvent

Event MissionParentScript.MissionAccepted(missionparentscript akSender, Var[] akArgs)
  missionquestscript acceptedQuest = akArgs[0] as missionquestscript
  If acceptedQuest as Bool && (acceptedQuest.MissionType == 0 || acceptedQuest.MissionType == 9)
    Self.UnregisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted")
    Self.SetStage(EndQuestStage)
  EndIf
EndEvent
