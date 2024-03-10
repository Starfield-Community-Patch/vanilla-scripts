ScriptName OE_CiviliansScript Extends Quest

;-- Variables ---------------------------------------
retriggerscript triggerRef

;-- Properties --------------------------------------
Group RQ_Settlement
  Keyword Property RQSettlementEvent Auto Const mandatory
  { story event to send to try to start a settlement RQ - send after NPCs are spawned }
  ReferenceAlias Property Trigger Auto Const mandatory
  LocationAlias Property OE_Location Auto Const mandatory
  Quest Property settlementQuest Auto hidden
  { if a settlement RQ starts, hang on to it here }
EndGroup

Group missionBoardData
  LocationRefType Property Mission_CargoDestinationLocRefType Auto Const mandatory
  { check location for this ref type - if it has one, make it a cargo destination }
  Keyword Property Mission_CargoDestination Auto Const mandatory
  { tag cargo destination locations when OE_Civilian starts }
  LocationRefType Property Mission_PassengerDestinationLocRefType Auto Const mandatory
  { check location for this ref type - if it has one, make it a passenger destination }
  Keyword Property Mission_PassengerDestination Auto Const mandatory
  { tag passenger destination locations when OE_Civilian starts }
EndGroup

sq_parentscript Property SQ_Parent Auto Const mandatory
RefCollectionAlias Property MissionTerminals Auto Const mandatory
ReferenceAlias Property NPC_Leader Auto Const mandatory
ReferenceAlias Property NPC_Merchant Auto Const mandatory
Keyword Property OE_Civilians_MissionTerminalAvailable Auto Const mandatory
Keyword Property VendorContainerKeyword01 Auto Const mandatory
RefCollectionAlias Property LivingAreas Auto Const mandatory
Keyword Property OE_Civilians_LinkLivingArea Auto Const mandatory
RefCollectionAlias Property NPCs_All Auto Const mandatory
{ put all NPCs into this collection after spawning }
RefCollectionAlias[] Property NPC_Collections Auto Const mandatory
{ array of all ref collections that NPCs are spawned into }
ActorValue Property OE_Civilian_NightShift Auto Const mandatory
{ autofill - use to tag "night shift" civilians for package schedule }
ActorValue Property OE_Civilians_DIAL_LeaderGender Auto Const mandatory
{ autofill - use to tag Merchant with leader's gender }
Int Property SpawnStage = 10 Auto Const
{ stage to set when ready to spawn NPCs }
Keyword Property SQ_TreasureMap_CreateMapStoryEvent Auto Const mandatory
{ story event to send to try to place treasure maps for sale by vendor }
GlobalVariable Property SQ_TreasureMap_CreateAny Auto Const mandatory
{ holds value for story manager to create any type of treasure map (99) }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.RegisterForRemoteEvent(MissionTerminals as ScriptObject, "OnAliasChanged")
  Self.RegisterForRemoteEvent(NPC_Leader as ScriptObject, "OnAliasChanged")
  Self.RegisterForRemoteEvent(Trigger as ScriptObject, "OnLoad")
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript
  Self.RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns as ScriptObject, "defaultgroupspawnquestscript_SpawnGroupDoneEvent")
  Self.SetStage(SpawnStage)
  triggerRef = Trigger.GetRef() as retriggerscript
EndEvent

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.CheckAndAddKeyword()
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.CheckAndAddKeyword()
EndEvent

Event ReferenceAlias.OnLoad(ReferenceAlias akSender)
  If akSender == Trigger && settlementQuest == None
    Self.StartRQ()
  EndIf
EndEvent

Function CheckAndAddKeyword()
  ObjectReference LeaderRef = NPC_Leader.GetReference()
  If MissionTerminals.GetCount() > 0 && LeaderRef as Bool
    LeaderRef.AddKeyword(OE_Civilians_MissionTerminalAvailable)
  EndIf
EndFunction

Function SetupSpawnedNPCs()
  Int I = 0
  While I < NPC_Collections.Length
    RefCollectionAlias SpawnCollection = NPC_Collections[I]
    NPCs_All.AddRefCollection(SpawnCollection)
    I += 1
  EndWhile
  ObjectReference[] spawnArray = NPCs_All.GetArray()
  I = 0
  Bool nightShiftToggle = False
  Int livingAreasIndex = 0
  While I < spawnArray.Length
    ObjectReference theNPC = spawnArray[I]
    If nightShiftToggle
      theNPC.SetValue(OE_Civilian_NightShift, 1.0)
    EndIf
    nightShiftToggle = !nightShiftToggle
    theNPC.SetLinkedRef(LivingAreas.GetAt(livingAreasIndex), OE_Civilians_LinkLivingArea, False)
    livingAreasIndex += 1
    If livingAreasIndex >= LivingAreas.GetCount()
      livingAreasIndex = 0
    EndIf
    I += 1
  EndWhile
  Actor merchantRef = NPC_Merchant.GetActorRef()
  Actor LeaderRef = NPC_Leader.GetActorRef()
  If merchantRef as Bool && LeaderRef as Bool
    ActorBase leaderBase = LeaderRef.GetBaseObject() as ActorBase
    If leaderBase
      LeaderRef.SetValue(OE_Civilians_DIAL_LeaderGender, leaderBase.GetSex() as Float)
    EndIf
  EndIf
EndFunction

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(defaultgroupspawnquestscript akSender, Var[] akArgs)
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript
  If DefaultGroupSpawnQuestScriptIns.GroupSetupCompleted
    Location myLocation = OE_Location.GetLocation()
    Self.StartRQ()
    Actor merchantRef = NPC_Merchant.GetActorRef()
    If merchantRef
      ObjectReference vendorContainer = merchantRef.GetLinkedRef(VendorContainerKeyword01)
      If vendorContainer
        SQ_TreasureMap_CreateMapStoryEvent.SendStoryEvent(myLocation, vendorContainer, None, SQ_TreasureMap_CreateAny.GetValueInt(), 0)
      EndIf
    EndIf
    Self.SetupSpawnedNPCs()
    If SQ_Parent.VisibleOnStarmap(myLocation)
      If myLocation.HasRefType(Mission_CargoDestinationLocRefType)
        myLocation.AddKeyword(Mission_CargoDestination)
      EndIf
      If myLocation.HasRefType(Mission_PassengerDestinationLocRefType)
        myLocation.AddKeyword(Mission_PassengerDestination)
      EndIf
    EndIf
  EndIf
EndEvent

Function StartRQ()
  If settlementQuest == None
    Quest[] settlementQuests = RQSettlementEvent.SendStoryEventAndWait(OE_Location.GetLocation(), Trigger.GetRef(), None, 0, 0)
    If settlementQuests
      settlementQuest = settlementQuests[0]
      Self.RegisterForRemoteEvent(settlementQuest as ScriptObject, "OnQuestShutdown")
      oescript myOE = (Self as Quest) as oescript
      If myOE
        myOE.StopQuestWhenPlayerLeavesPlanet = False
      EndIf
      If settlementQuest is rqscript && myOE.OwningFaction as Bool
        Int failsafeCount = 0
        While settlementQuest.IsStarting() && failsafeCount < 50
          failsafeCount += 1
          Utility.Wait(1.0)
        EndWhile
        (settlementQuest as rqscript).SetLocationOwnership(myOE.OwningFaction)
      EndIf
    EndIf
  EndIf
EndFunction

Event Quest.OnQuestShutdown(Quest akSource)
  If akSource == settlementQuest
    Self.UnregisterForRemoteEvent(settlementQuest as ScriptObject, "OnQuestShutdown")
    settlementQuest = None
    rescript myRE = (Self as Quest) as rescript
    If myRE
      myRE.StopQuestWhenPlayerLeavesPlanet = True
    EndIf
  EndIf
EndEvent

Event OnQuestShutdown()
  If triggerRef
    triggerRef.ReArmTrigger()
    triggerRef = None
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
