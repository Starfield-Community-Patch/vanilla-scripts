ScriptName MS06ResetActorsScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueECSConstant Auto Const

;-- Functions ---------------------------------------

Event OnReset()
  dialogueecsconstantquestscript questScript = DialogueECSConstant as dialogueecsconstantquestscript
  questScript.GenericNPCs.ResetAll()
EndEvent
