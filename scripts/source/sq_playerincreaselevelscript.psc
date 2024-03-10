ScriptName SQ_PlayerIncreaseLevelScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MB_MaxTargetLevel Auto Const mandatory
{ global for max encounter level }
Int Property encounterLevelMaxAdjustment = 10 Auto Const
{ how much to add to player level to get max encounter level global }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Actor playerRef = Game.GetPlayer()
  Int playerLevel = playerRef.GetLevel()
  MB_MaxTargetLevel.SetValueInt(playerLevel + encounterLevelMaxAdjustment)
  Self.Stop()
EndEvent
