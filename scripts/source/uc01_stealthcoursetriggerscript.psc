ScriptName UC01_StealthCourseTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool bProcessing
Int iTriggerCount

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
{ Quest object that manages this stage }
Int Property ShutdownStage = 400 Auto Const
{ Once this stage is set on UC01, shut it all down }
Faction Property UC01_SectorBEnemyFaction Auto Const mandatory
{ Faction to apply to the player if they're in the trigger }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If !UC01.GetStageDone(ShutdownStage)
    Self.AdjustTriggerCount(True)
  EndIf
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If !UC01.GetStageDone(ShutdownStage)
    Self.AdjustTriggerCount(False)
  EndIf
EndEvent

Function AdjustTriggerCount(Bool bAdd)
  While bProcessing
    Utility.Wait(0.5)
  EndWhile
  bProcessing = True
  Actor PlayerACT = Game.GetPlayer()
  If bAdd
    iTriggerCount += 1
    If iTriggerCount == 1
      PlayerACT.AddToFaction(UC01_SectorBEnemyFaction)
    EndIf
  Else
    iTriggerCount -= 1
    If iTriggerCount == 0
      PlayerACT.RemoveFromFaction(UC01_SectorBEnemyFaction)
    EndIf
  EndIf
  bProcessing = False
EndFunction
