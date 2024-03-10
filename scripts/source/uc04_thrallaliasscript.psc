ScriptName UC04_ThrallAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 575 Auto Const
{ Don't register for events until this stage is set }
Int Property ShutdownStage = 610 Auto Const
{ If this stage is set, shut all this behavior down }
Int Property StageToSet = 582 Auto Const
{ Stage to set if the player shoots an NPC }
conditionform Property UC04_WeaponIsTypeEM Auto Const mandatory
{ Condition form used to check if the player's using EM weapons }
ReferenceAlias Property TriggerStationInterior Auto Const mandatory
{ Trigger that wraps the interior of the NAT train station }
Keyword Property UC04_Thrall_TeleportMarker_LinkedRef Auto Const mandatory
{ Keyword to find the proper linked ref for the thralls to teleport to }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    Self.RegisterForHitEvent(Self.GetRef() as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  ElseIf auiStageID == ShutdownStage
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    Self.UnregisterForAllHitEvents(None)
  EndIf
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If !Self.GetOwningQuest().GetStageDone(ShutdownStage)
    If (akAggressor == Game.GetPlayer() as ObjectReference) && !UC04_WeaponIsTypeEM.IsTrue(None, None)
      Self.UnregisterForAllHitEvents(None)
      Self.GetOwningQuest().SetStage(StageToSet)
    Else
      Self.RegisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True)
    EndIf
  Else
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet")
    Self.UnregisterForAllHitEvents(None)
  EndIf
EndEvent

Event OnCellLoad()
  ObjectReference currREF = Self.GetRef()
  If !currREF.IsInTrigger(TriggerStationInterior.GetRef()) && !Game.GetPlayer().HasDetectionLOS(currREF)
    ObjectReference TeleportMarker = currREF.GetLinkedRef(UC04_Thrall_TeleportMarker_LinkedRef)
    If TeleportMarker
      currREF.MoveTo(TeleportMarker, 0.0, 0.0, 0.0, True, False)
    EndIf
  EndIf
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction
