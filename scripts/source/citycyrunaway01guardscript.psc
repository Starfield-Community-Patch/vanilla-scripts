ScriptName CityCYRunaway01GuardScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bLoaded = False

;-- Properties --------------------------------------
Int Property LobbyTriggerStage = 470 Auto Const

;-- Functions ---------------------------------------

Function GuardAlarm()
  If Self.GetOwningQuest().GetStageDone(LobbyTriggerStage)
    Self.GetActorRef().SendTrespassAlarm(Game.GetPlayer())
  Else
    Self.StartTimer(2.0, 0)
  EndIf
EndFunction

Event OnLoad()
  If bLoaded == False
    Self.GuardAlarm()
    bLoaded = True
  EndIf
EndEvent

Event OnTimer(Int aiTimerId)
  Self.GuardAlarm()
EndEvent
