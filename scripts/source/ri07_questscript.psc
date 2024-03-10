ScriptName RI07_QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer MeetingLayer
inputenablelayer NeurosurgeryLayer

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const
Int Property iTurnOffStage Auto Const

;-- Functions ---------------------------------------

Function FreezeControls()
  Game.GetPlayer().StopCombatAlarm()
  NeurosurgeryLayer = inputenablelayer.Create()
  NeurosurgeryLayer.DisablePlayerControls(True, True, False, True, False, True, True, False, True, True, False)
EndFunction

Function UnfreezeControls()
  NeurosurgeryLayer = None
EndFunction

Function FreezeControlsMeeting()
  Game.GetPlayer().StopCombatAlarm()
  MeetingLayer = inputenablelayer.Create()
  MeetingLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False)
EndFunction

Function UnfreezeControlsMeeting()
  MeetingLayer = None
EndFunction

Function StartDeMarcusTimer()
  Self.StartTimer(60.0, 1)
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1 && !Self.GetStageDone(iTurnOffStage)
    Self.SetStage(iStageToSet)
  EndIf
EndEvent
