ScriptName UC05_ArchivalCodeMachineScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool bIncooldown
Bool bIssueLineOnce
Int iTimerID = 1 Const

;-- Properties --------------------------------------
Key Property RequiredKey Auto Const mandatory
{ Key object player must have in order to access this }
Topic Property UC05_PlayerLacksCodeMachineKey Auto Const mandatory
{ Topic to play when the player lacks the key to access this code machine }
Topic Property UC05_IssuingCode Auto Const mandatory
{ Topic to play when issuing the code }
Topic Property UC05_CodeDispensed Auto Const mandatory
{ Topic to play when the player lacks the key to access this code machine }
Quest Property UC05 Auto Const mandatory
{ Quest object for UC05 }
Int Property StageToSet Auto Const mandatory
{ If the player has the required key, set this stage }
Int Property AudioCooldown = 7 Auto Const
{ How long to wait between audio lines }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayACT = Game.GetPlayer()
  If akActionRef == PlayACT as ObjectReference
    If UC05.GetStageDone(StageToSet)
      If !bIncooldown
        bIncooldown = True
        Self.StartTimer(AudioCooldown as Float, iTimerID)
        Self.Say(UC05_CodeDispensed, None, False, None)
      EndIf
    ElseIf PlayACT.GetItemCount(RequiredKey as Form) < 1
      If !bIncooldown
        bIncooldown = True
        Self.StartTimer(AudioCooldown as Float, iTimerID)
        Self.Say(UC05_PlayerLacksCodeMachineKey, None, False, None)
      EndIf
    ElseIf PlayACT.GetItemCount(RequiredKey as Form) >= 1
      If !UC05.GetStageDone(StageToSet)
        If !bIssueLineOnce
          bIssueLineOnce = True
          Self.Say(UC05_IssuingCode, None, False, None)
        EndIf
        Utility.Wait(2.0)
        UC05.SetStage(StageToSet)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID
    bIncooldown = False
  EndIf
EndEvent
