ScriptName DefaultCrowdEventTIF Extends TopicInfo Const
{ Used to send CrowdEvents from DefaultCrowdEventManager script
This script will use GetOwningQuest() and cast it as a DefaultCrowdEventManager to do the sending of the events.
So the DefaultCrowdEventManager script must be attached to the quest that owns this topic info }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property EventToSend Auto Const
{ What even are we sending?
Likely  the keyword is named:
CrowdEvent_<EventName> }
Bool Property SendOnBegin = False Auto Const
Bool Property SendOnEnd = True Auto Const

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SendOnBegin
    (Self.GetOwningQuest() as defaultcrowdeventmanager).SendCrowdEvent(EventToSend, akSpeakerRef, None)
  EndIf
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SendOnEnd
    (Self.GetOwningQuest() as defaultcrowdeventmanager).SendCrowdEvent(EventToSend, akSpeakerRef, None)
  EndIf
EndEvent
