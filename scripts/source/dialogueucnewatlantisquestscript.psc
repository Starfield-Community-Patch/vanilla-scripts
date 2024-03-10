ScriptName DialogueUCNewAtlantisQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group HyperloopSceneVars
  Int Property HyperloopDepart Auto conditional
  { Int automatically set based on departing station }
  Int Property HyperloopArrive Auto conditional
  { Int set by player choice in scene }
EndGroup

Group ViewportDialogueVars
  Int Property ViewPortVisitUpdate Auto conditional
  { int compared against PlayerVisited_NewAtlantis Global }
  Int Property ViewportDialogueVersion Auto conditional
  { int incremented when player has finished dialogue with related actor AND left/returned to city }
  Int Property ViewportReadyForUpdate Auto conditional
  { int set to 1 when player has finished dialogue with related actor }
EndGroup

GlobalVariable Property pPlayerVisited_NewAtlantis Auto Const mandatory
