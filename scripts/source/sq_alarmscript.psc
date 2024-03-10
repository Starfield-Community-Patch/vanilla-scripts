ScriptName SQ_AlarmScript Extends Quest conditional

;-- Variables ---------------------------------------
Bool alarmTriggered = False conditional

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AlarmTriggeredLock
Guard triggerAlarmLock

;-- Properties --------------------------------------
ReferenceAlias Property AlarmNPC Auto Const mandatory
{ NPC that will try to trigger an alarm }
ReferenceAlias Property Alarm Auto Const mandatory
{ alarm that NPC will try to reach }
RefCollectionAlias Property Alarms Auto Const mandatory
{ collection of all alarms }
RefCollectionAlias Property AlarmNPCs Auto Const mandatory
{ collection of NPCs who could trigger an alarm }
RefCollectionAlias Property AlarmCameras Auto Const mandatory
{ collection of security cameras who could trigger an alarm }
ActorValue Property SQ_Alarmed Auto Const mandatory
{ actor value to set on alarmed NPCs }
ActorValue Property Suspicious Auto Const mandatory
{ actor value to set on alarmed NPCs }
Scene Property SQ_AlarmScene Auto Const mandatory
{ scene to start when an NPC wants to trigger an alarm }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ for custom events }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(AlarmNPCs as ScriptObject, "OnCombatStateChanged")
  Self.RegisterForRemoteEvent(AlarmNPCs as ScriptObject, "OnUnload")
  Self.RegisterForRemoteEvent(Alarms as ScriptObject, "OnOpen")
  Self.RegisterForRemoteEvent(Alarms as ScriptObject, "OnClose")
  Self.RegisterForRemoteEvent(AlarmCameras as ScriptObject, "OnCombatStateChanged")
  Self.RegisterForRemoteEvent(AlarmCameras as ScriptObject, "OnUnload")
EndEvent

Event OnQuestStarted()
  Int I = 0
  While I < Alarms.GetCount()
    sq_alarmactivatorscript theAlarm = Alarms.GetAt(I) as sq_alarmactivatorscript
    If theAlarm
      theAlarm.myAlarmQuest = Self
    EndIf
    I += 1
  EndWhile
EndEvent

Function TriggerAlarmAttempt(Actor alarmActor)
  Guard triggerAlarmLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If (alarmActor as Bool && alarmTriggered == False) && SQ_AlarmScene.IsPlaying() == False
      AlarmNPC.ForceRefTo(alarmActor as ObjectReference)
      Alarm.ClearAndRefillAlias()
      SQ_AlarmScene.Start()
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function TriggerCameraAlarm(Actor alarmCamera)
  Guard triggerAlarmLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If alarmCamera as Bool && alarmTriggered == False
      SQ_AlarmScene.Stop()
      AlarmNPC.ForceRefTo(alarmCamera as ObjectReference)
      Alarm.ClearAndRefillAlias()
      Self.SetAlarmed(True)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function SetAlarmed(Bool bAlarmed)
  Guard AlarmTriggeredLock ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If bAlarmed != alarmTriggered
      alarmTriggered = bAlarmed
      If bAlarmed
        SQ_Parent.SendAlarmTriggeredOnEvent(Alarm.GetRef(), AlarmNPC.GetActorRef(), Self)
      Else
        SQ_Parent.SendAlarmTriggeredOffEvent(Alarm.GetRef(), Self)
      EndIf
      Int I = 0
      While I < AlarmNPCs.GetCount()
        Actor theActor = AlarmNPCs.GetActorAt(I)
        If theActor
          theActor.SetValue(SQ_Alarmed, (bAlarmed as Int) as Float)
          If bAlarmed && theActor.GetValue(Suspicious) < 1.0
            theActor.SetValue(Suspicious, 1.0)
          EndIf
          theActor.EvaluatePackage(False)
        EndIf
        I += 1
      EndWhile
      I = 0
      While I < Alarms.GetCount()
        sq_alarmactivatorscript theAlarm = Alarms.GetAt(I) as sq_alarmactivatorscript
        If theAlarm
          theAlarm.SetOpen(bAlarmed)
        EndIf
        I += 1
      EndWhile
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Event RefCollectionAlias.OnOpen(RefCollectionAlias akCollection, ObjectReference akSenderRef, ObjectReference akActionRef)
  Self.SetAlarmed(True)
EndEvent

Event RefCollectionAlias.OnCombatStateChanged(RefCollectionAlias akCollection, ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1
    If akCollection == AlarmNPCs
      Self.TriggerAlarmAttempt(akSenderRef as Actor)
    ElseIf akCollection == AlarmCameras
      Self.TriggerCameraAlarm(akSenderRef as Actor)
    EndIf
  EndIf
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akCollection, ObjectReference akSenderRef)
  Self.CheckForShutdown()
EndEvent

Function CheckForShutdown()
  If Self.IsRunning()
    Int deadorunloaded = AlarmNPCs.GetCountDeadOr3DUnloaded() + AlarmCameras.GetCountDeadOr3DUnloaded()
    Int total = AlarmNPCs.GetCount() + AlarmCameras.GetCount()
    If deadorunloaded >= total
      Self.SetAlarmed(False)
      Self.Stop()
    Else
      Self.StartTimer(10.0, 0)
    EndIf
  EndIf
EndFunction

Event OnTimer(Int aiTimerID)
  Self.CheckForShutdown()
EndEvent
