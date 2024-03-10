ScriptName DefaultCrowdEventMember Extends Actor default
{ Data for how this actor should respond to events sent by a DefaultCrowdEventManager }

;-- Structs -----------------------------------------
Struct EventDatum
  Keyword EventKeyword
  { Keyword representing the event to respond to }
  Keyword EventTopicSubType
  { Topic SubType keyword to say when responding to the event }
  Int EventChanceToRespond = 75
  { 0-100, chance to respond to this event }
  Float MinResponseDelay = 0.0
  { In seconds, minimum amount of time to wait before responding to event }
  Float MaxResponseDelay = 3.0
  { In seconds, maximum amount of time to wait before responding to event }
  Float CoolDown = 3.0
  { In seconds, the time to wait before responding to any event after this event has been responded to }
  Bool RequireToFaceEitherEventRef = True
  { Does the actor need to be facing one of the EventRefs to respond?
	Note: this does NOT cause the actor to face the EventRefs, just ignores the event if not facing }
EndStruct


;-- Variables ---------------------------------------
Bool coolingDown = False

;-- Properties --------------------------------------
Group Data
  defaultcrowdeventmanager[] Property CrowdEventManagers Auto Const
  { Pointer to quests whose CrowdEvent you are going to listen to. Quest must have a DefaultCrowdEventManager script attached. }
  defaultcrowdeventmember:eventdatum[] Property EventData Auto Const
  { Add keywords and correspond topics to say.
Note: You can define multiple responses to the same event, but they will stop processing after responding to the first event the pass for, until the cool down. }
EndGroup

Group Quest_Properties
  Quest Property ControllingQuest Auto Const
  Int Property DisableOnStage Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Int I = 0
  While I < CrowdEventManagers.Length
    Self.RegisterForCustomEvent(CrowdEventManagers[I] as ScriptObject, "defaultcrowdeventmanager_CrowdEvent")
    I += 1
  EndWhile
EndEvent

Event DefaultCrowdEventManager.CrowdEvent(defaultcrowdeventmanager akSender, Var[] akArgs)
  If !ControllingQuest.GetStageDone(DisableOnStage)
    If coolingDown
      Return 
    EndIf
    coolingDown = True
    Float CoolDown = 0.0
    defaultcrowdeventmanager:crowdeventdata myCrowdEventData = akArgs[0] as defaultcrowdeventmanager:crowdeventdata
    Keyword EventKeyword = myCrowdEventData.EventKeyword
    ObjectReference EventRef1 = myCrowdEventData.EventRef1
    ObjectReference EventRef2 = myCrowdEventData.EventRef2
    Float HeadingAngleToRef1 = 0.0
    Float HeadingAngleToRef2 = 0.0
    If EventRef1
      HeadingAngleToRef1 = Math.abs(Self.GetHeadingAngle(EventRef1))
    EndIf
    If EventRef2
      HeadingAngleToRef2 = Math.abs(Self.GetHeadingAngle(EventRef2))
    EndIf
    Float FacingAngle = 45.0
    Float delay = 0.0
    Int chanceRoll = 0
    Int I = 0
    While I < EventData.Length && CoolDown == 0.0
      If EventData[I].RequireToFaceEitherEventRef && HeadingAngleToRef1 > FacingAngle && HeadingAngleToRef2 > FacingAngle
        
      ElseIf EventData[I].EventKeyword == EventKeyword
        chanceRoll = Utility.RandomInt(0, 100)
        If chanceRoll < EventData[I].EventChanceToRespond
          delay = Utility.RandomFloat(EventData[I].MinResponseDelay, EventData[I].MaxResponseDelay)
          Utility.wait(delay)
          Self.SayCustom(EventData[I].EventTopicSubType, None, False, None)
          CoolDown = EventData[I].CoolDown
        EndIf
      EndIf
      I += 1
    EndWhile
    If CoolDown > 0.0
      Utility.wait(CoolDown)
    EndIf
    coolingDown = False
  EndIf
EndEvent
