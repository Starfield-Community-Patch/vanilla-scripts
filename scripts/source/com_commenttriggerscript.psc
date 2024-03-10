ScriptName COM_CommentTriggerScript Extends ObjectReference
{ Companion entering this trigger will send an AffinityEvent.
If there is a linked ref attached to this trigger, the companion will attempt to walk to it before sending the AffinityEvent.
If there is a linked ref attached to this trigger, that will be the Target of the AffinityEvent. }

;-- Variables ---------------------------------------
Int[] DoneIDs
companionactorscript TriggeringCompanionRef

;-- Properties --------------------------------------
Group autofill collapsedonref
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { autofill }
EndGroup

Group Advanced collapsedonref
  Keyword Property COM_CommentTriggerStart Auto Const mandatory
  { autotfill (if using default); they keyword that starts the quest that packages the Companion to walk to the thing to comment on (if linked ref to this trigger)
if you want to use a specifc quest for something custom, you can replace this property with another keyword to start that quest. It will need the COM_CommentTriggerQuestScript to call back to this trigger. }
EndGroup

Group Properties
  Bool Property OncePerCompanion = True Auto Const
  { if true (default), this is triggered only once per companion }
  conditionform Property COM_CND_Comment_CommentsAllowed Auto Const mandatory
  { Condition form used when multiple companions are following to prevent comment stomping }
  affinityevent Property AffinityEventToSend Auto Const mandatory
  { This is the affinity event to send. 

Primarily it will be used for it's data such as Topic To Say data
But also consider using the data for "Allow Repeated Event," and "Cool Down Days."
Use random info stacks and "say once" info flags if you want to have randomized or finite things to say in conjunction with allow repeated and cool days. }
EndGroup


;-- Functions ---------------------------------------

Event OnUnload()
  Self.UnregisterForAllEvents()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If OncePerCompanion && DoneIDs == None
    DoneIDs = new Int[0]
  EndIf
  TriggeringCompanionRef = akActionRef as companionactorscript
  If TriggeringCompanionRef as Bool && COM_CND_Comment_CommentsAllowed.IsTrue(TriggeringCompanionRef as ObjectReference, None)
    Bool alreadyTriggered = False
    Int companionID = -1
    If OncePerCompanion
      companionID = TriggeringCompanionRef.GetCompanionIDValueInt()
      alreadyTriggered = DoneIDs.find(companionID, 0) > -1
    EndIf
    If OncePerCompanion == False || alreadyTriggered == False
      If Self.IsCompanionOrPlayerInCombat()
        Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnCombatStateChanged")
        Self.RegisterForRemoteEvent(TriggeringCompanionRef as ScriptObject, "OnCombatStateChanged")
      Else
        Self.StartCommentSceneQuest()
      EndIf
    EndIf
  EndIf
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If TriggeringCompanionRef as Bool && Self.IsCompanionOrPlayerInCombat() == False
    If Self.IsInTrigger(TriggeringCompanionRef as ObjectReference)
      Self.StartCommentSceneQuest()
    EndIf
  EndIf
EndEvent

Bool Function IsCompanionOrPlayerInCombat()
  Bool triggeringCompanionIsInCombat = TriggeringCompanionRef as Bool && TriggeringCompanionRef.IsInCombat()
  Bool playerIsInCombat = Game.GetPlayer().IsInCombat()
  Bool returnVal = triggeringCompanionIsInCombat || playerIsInCombat
  Return returnVal
EndFunction

Function StartCommentSceneQuest()
  If TriggeringCompanionRef
    If ((SQ_Companions as Quest) as companionaffinityeventsscript).IsNearImportantScene(True, True) == False
      If OncePerCompanion
        DoneIDs.add(TriggeringCompanionRef.GetCompanionIDValueInt(), 1)
      EndIf
      Quest[] startedQuests = COM_CommentTriggerStart.SendStoryEventAndWait(None, Self as ObjectReference, TriggeringCompanionRef as ObjectReference, 0, 0)
      Bool successfullyStartedQuest = startedQuests.Length > 0
    EndIf
  EndIf
  TriggeringCompanionRef = None
EndFunction

Function SendAffinityEvent(companionactorscript CompanionActorRef, ObjectReference TargetRef)
  AffinityEventToSend.Send(TargetRef)
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
