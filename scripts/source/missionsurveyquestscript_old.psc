ScriptName MissionSurveyQuestScript_OLD Extends MissionQuestScript conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MissionTypeData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Int Property LocatedSiteStage = 20 Auto Const
  { stage to set when valid site is location (or player starts with one) }
EndGroup

