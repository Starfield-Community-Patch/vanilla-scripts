ScriptName TriggerAmbushOnMarkerHit Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DMP_AmbushMarker Auto Const mandatory
{ Keyword used to find the critter linked to this ambush marker }
Keyword Property LinkAmbushTrigger Auto Const mandatory
{ Keyword to find the trigger linked to the ambushing critter }

;-- Functions ---------------------------------------

Function ProcessHit()
  ObjectReference[] LinkedNPCs = Self.GetRefsLinkedToMe(DMP_AmbushMarker, None)
  Int iLength = LinkedNPCs.Length
  Bool AmbushNPCFound = False
  Actor NPCRef = None
  If iLength > 0 && !AmbushNPCFound
    Int I = 0
    NPCRef = LinkedNPCs[I] as Actor
    If NPCRef != None
      AmbushNPCFound = True
    EndIf
  EndIf
  If AmbushNPCFound
    defaultrefambushtrigger2 TriggerRef = NPCRef.GetLinkedRef(LinkAmbushTrigger) as defaultrefambushtrigger2
    If TriggerRef != None
      TriggerRef.TriggerAmbush()
    EndIf
  EndIf
  Self.GotoState("Triggered")
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

;-- State -------------------------------------------
State Triggered

  Event OnLoad()
    ; Empty function
  EndEvent

  Event OnUnload()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    Self.ProcessHit()
  EndEvent

  Event OnUnload()
    Self.UnregisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndEvent

  Event OnLoad()
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  EndEvent
EndState
