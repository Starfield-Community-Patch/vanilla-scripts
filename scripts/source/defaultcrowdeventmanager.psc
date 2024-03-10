ScriptName DefaultCrowdEventManager Extends Quest
{ Handles sending events to crowds to get them to "ooh" and "ahh"

See also:
DefaultCrowdEventSenderAliasScript }

;-- Structs -----------------------------------------
Struct CrowdEventData
  Keyword EventKeyword
  ObjectReference EventRef1
  ObjectReference EventRef2
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CrowdData
  Keyword Property CrowdEventMember Auto Const
  { AUTOFILL THIS -- which keyword will be used to find actors to make the crowd? }
  RefCollectionAlias Property RefCollection Auto Const
  { which Reference Collection should the crowd members be put in? }
  ReferenceAlias Property FindOrigin Auto Const
  { Which ref alias should be the origin for the find radius in which to find the crowd? }
  Int Property FindRadius = 5000 Auto Const
  { Default: 5000, How big a radius around the FindOriginAlias should we look for crowd members? }
EndGroup

Group CommonEventKeywords
  Keyword Property CrowdEvent_OnHit Auto Const
  { Autofill }
  Int Property StopSendingOnHitAfterStage Auto Const
  { After this stage or higher, stop sending this event }
  Keyword Property CrowdEvent_OnCripple Auto Const
  { Autofill }
  Int Property StopSendingOnCrippleAfterStage Auto Const
  { After this stage or higher, stop sending this event }
  Keyword Property CrowdEvent_OnDeath Auto Const
  { Autofill }
  Int Property StopSendingOnDeathAfterStage Auto Const
  { After this stage or higher, stop sending this event }
EndGroup

Group CommonEventSenders
  ReferenceAlias[] Property OnHitEventSenders Auto Const
  { Aliases that should send the CrowdEvent_OnHit to crowd members }
  ReferenceAlias[] Property OnCrippleEventSenders Auto Const
  { Aliases that should send the CrowdEvent_OnCripple to crowd members }
  ReferenceAlias[] Property OnDeathEventSenders Auto Const
  { Aliases that should send the CrowdEvent_OnDeath to crowd members }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.RegisterForOnHitEvents()
  Int I = 0
  I = 0
  While I < OnCrippleEventSenders.Length
    Self.RegisterForRemoteEvent(OnCrippleEventSenders[I] as ScriptObject, "OnCripple")
    I += 1
  EndWhile
  I = 0
  While I < OnDeathEventSenders.Length
    Self.RegisterForRemoteEvent(OnDeathEventSenders[I] as ScriptObject, "OnDeath")
    I += 1
  EndWhile
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If Self.GetStage() < StopSendingOnHitAfterStage
    Self.SendCrowdEvent(CrowdEvent_OnHit, akTarget, akAggressor)
    Self.RegisterForOnHitEvents()
  Else
    Self.UnregisterForOnHitEvents()
  EndIf
EndEvent

Event ReferenceAlias.OnCripple(ReferenceAlias akSender, ActorValue akActorValue, Bool abCrippled)
  If Self.GetStage() < StopSendingOnCrippleAfterStage
    Self.SendCrowdEvent(CrowdEvent_OnCripple, akSender.GetReference(), None)
  Else
    Int I = 0
    While I < OnCrippleEventSenders.Length
      Self.UnregisterForRemoteEvent(OnCrippleEventSenders[I] as ScriptObject, "OnCripple")
      I += 1
    EndWhile
  EndIf
EndEvent

Event ReferenceAlias.OnDeath(ReferenceAlias akSender, ObjectReference akKiller)
  If Self.GetStage() < StopSendingOnDeathAfterStage
    Self.SendCrowdEvent(CrowdEvent_OnDeath, akSender.GetReference(), akKiller)
  Else
    Int I = 0
    While I < OnDeathEventSenders.Length
      Self.UnregisterForRemoteEvent(OnDeathEventSenders[I] as ScriptObject, "OnDeath")
      I += 1
    EndWhile
  EndIf
EndEvent

Function RegisterForOnHitEvents()
  Int I = 0
  While I < OnHitEventSenders.Length
    Self.RegisterForHitEvent(OnHitEventSenders[I] as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    I += 1
  EndWhile
EndFunction

Function UnregisterForOnHitEvents()
  Int I = 0
  While I < OnHitEventSenders.Length
    Self.UnregisterForHitEvent(OnHitEventSenders[I] as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    I += 1
  EndWhile
EndFunction

Function SendCrowdEvent(Keyword EventToSend, ObjectReference EventRef1, ObjectReference EventRef2)
  Var[] args = new Var[1]
  defaultcrowdeventmanager:crowdeventdata myCrowdEventData = new defaultcrowdeventmanager:crowdeventdata
  myCrowdEventData.EventKeyword = EventToSend
  myCrowdEventData.EventRef1 = EventRef1
  myCrowdEventData.EventRef2 = EventRef2
  args[0] = myCrowdEventData as Var
  Self.SendCustomEvent("defaultcrowdeventmanager_CrowdEvent", args)
EndFunction

Function CreateCrowdInLoadedArea()
  Location OriginLocation = FindOrigin.GetReference().GetCurrentLocation()
  Int SecondsToBailout = 5
  Int waitingFor = 0
  While OriginLocation.IsLoaded() == False && waitingFor < SecondsToBailout
    Utility.wait(1.0)
    waitingFor += 1
  EndWhile
  ObjectReference[] foundRefs = FindOrigin.GetReference().FindAllReferencesWithKeyword(CrowdEventMember as Form, FindRadius as Float)
  RefCollection.RemoveAll()
  Int r = 0
  While r < foundRefs.Length
    RefCollection.AddRef(foundRefs[r])
    r += 1
  EndWhile
EndFunction
