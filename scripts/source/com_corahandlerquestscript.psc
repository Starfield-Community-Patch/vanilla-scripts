ScriptName COM_CoraHandlerQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ReferenceAlias Property Cora Auto Const mandatory
  ReferenceAlias Property SamCoe Auto Const mandatory
  LocationAlias Property PlayerShipLocation Auto Const mandatory
  ReferenceAlias Property PlayerShipCrewMarker Auto Const mandatory
  LocationAlias Property LodgeLocation Auto Const mandatory
  ReferenceAlias Property LodgeSandboxMarker Auto Const mandatory
  conditionform Property COM_CND_Cora_OnPlayerShip Auto Const mandatory
  conditionform Property COM_CND_Cora_AtLodge Auto Const mandatory
  conditionform Property COM_Cora_HandlerTeleportingAllowed Auto Const mandatory
  { when this is true and quest has started (MQ103 stage 100 starts it), Cora will teleport to player ship or lodge as needed. }
  ActorValue Property FollowerState Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor SamCoeRef = SamCoe.GetActorReference()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange")
  Self.RegisterForRemoteEvent(SamCoeRef as ScriptObject, "OnLocationChange")
  Self.RegisterForActorValueChangedEvent(SamCoeRef as ObjectReference, FollowerState)
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Actor CoraRef = Cora.GetActorReference()
  If COM_Cora_HandlerTeleportingAllowed.IsTrue(CoraRef as ObjectReference, None) == False
    Return 
  EndIf
  Location playerShipLoc = PlayerShipLocation.GetLocation()
  Location lodgeLoc = LodgeLocation.GetLocation()
  ObjectReference moveToRef = None
  If (playerShipLoc as Bool && CoraRef.GetCurrentLocation() != playerShipLoc) && COM_CND_Cora_OnPlayerShip.IsTrue(CoraRef as ObjectReference, None)
    moveToRef = PlayerShipCrewMarker.GetReference()
  ElseIf (lodgeLoc as Bool && CoraRef.GetCurrentLocation() != lodgeLoc) && COM_CND_Cora_AtLodge.IsTrue(CoraRef as ObjectReference, None)
    moveToRef = LodgeSandboxMarker.GetReference()
  EndIf
  If moveToRef
    CoraRef.MoveTo(moveToRef, 0.0, 0.0, 0.0, True, False)
    CoraRef.EvaluatePackage(False)
  EndIf
EndEvent

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  ObjectReference SamCoeRef = SamCoe.GetReference()
  If akObjRef == SamCoeRef && akActorValue == FollowerState
    Float value = SamCoeRef.GetValue(FollowerState)
    Cora.GetReference().SetValue(FollowerState, value)
    Self.RegisterForActorValueChangedEvent(SamCoeRef, FollowerState)
  EndIf
EndEvent

Function TestLodgeCondition()
  Actor CoraRef = Cora.GetActorReference()
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True)
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false
EndFunction
