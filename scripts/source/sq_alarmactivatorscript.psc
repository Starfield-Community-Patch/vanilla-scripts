ScriptName SQ_AlarmActivatorScript Extends ObjectReference conditional
{ script for the alarm activator; allows native terminals control }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AlarmDisabledGuard

;-- Properties --------------------------------------
Keyword Property SQ_AlarmStoryEvent Auto Const mandatory
{ send story event on load }
Message Property SQ_AlarmActivatorDisabledMessage Auto Const mandatory
{ message when alarm is disabled }
Message Property SQ_AlarmActivatorBlockedMessage Auto Const mandatory
{ message when alarm is disabled }
Bool Property AlarmDisabled = False Auto conditional
{ TRUE if alarm is disabled }
wwiseevent Property AlarmSoundEvent Auto Const
{ Alarm sound that should start playing when the alarm is turned on. }
Keyword Property LinkCustom01 Auto Const
{ Link to Optional sound source for the alarm sound }
sq_alarmscript Property myAlarmQuest Auto hidden

;-- Functions ---------------------------------------

Event OnLoad()
  Self.BlockActivation(True, False)
  Self.StartAlarmQuest()
EndEvent

Function TurnOnAlarm(Bool turnOn)
  Self.SetOpen(turnOn)
  If myAlarmQuest == None || myAlarmQuest.IsRunning() == False
    If AlarmSoundEvent
      If Self.GetLinkedRef(LinkCustom01)
        AlarmSoundEvent.Play(Self.GetLinkedRef(LinkCustom01), None, None)
      Else
        AlarmSoundEvent.Play(Self as ObjectReference, None, None)
      EndIf
    EndIf
    Self.StartAlarmQuest()
  EndIf
  If myAlarmQuest
    myAlarmQuest.SetAlarmed(turnOn)
  EndIf
EndFunction

Function DisableAlarm(Bool DisableAlarm)
  Guard AlarmDisabledGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    AlarmDisabled = DisableAlarm
    If DisableAlarm
      Self.TurnOnAlarm(False)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Bool Function GetAlarmDisabled()
  Guard AlarmDisabledGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Return AlarmDisabled
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function StartAlarmQuest()
  Quest[] alarmQuests = SQ_AlarmStoryEvent.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, 0, 0)
  If alarmQuests.Length > 0
    myAlarmQuest = alarmQuests[0] as sq_alarmscript
  EndIf
EndFunction

;-- State -------------------------------------------
State busy

  Event OnActivate(ObjectReference akActionRef)
    Bool disabled = Self.GetAlarmDisabled()
    If (akActionRef != Game.GetPlayer() as ObjectReference) && disabled == False
      Self.TurnOnAlarm(True)
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
Auto State ready

  Event OnActivate(ObjectReference akActionRef)
    Bool disabled = Self.GetAlarmDisabled()
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.gotostate("busy")
      If disabled
        SQ_AlarmActivatorDisabledMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      ElseIf Self.GetOpenState() >= 3
        SQ_AlarmActivatorBlockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      Else
        Self.TurnOnAlarm(False)
      EndIf
      Self.gotostate("ready")
    ElseIf disabled == False
      Self.TurnOnAlarm(True)
    EndIf
  EndEvent
EndState
