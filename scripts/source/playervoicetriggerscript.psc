ScriptName PlayerVoiceTriggerScript Extends ObjectReference
{ Handles all the Player Commentary Triggers }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property ScenetoStart Auto
Int Property TriggerType = 0 Auto
{ 0 = OnTriggerEnter, 1 = OnTriggerLeave }
Quest Property PrereqQuest Auto
{ Optional: Quest on which to check Stages }
Int Property prereqStage = -1 Auto
{ Optional: Stage that must be set to trigger scene }
Int Property maxStage = -1 Auto
{ Optional: Stage that invalidates scene, shut down and disable trigger }
