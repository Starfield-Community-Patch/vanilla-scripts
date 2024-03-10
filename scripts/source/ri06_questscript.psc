ScriptName RI06_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iSeanCallsSecurityStage = 1258 Auto Const
Int Property iDrLaneCallsSecurityStage = 1273 Auto Const
Int Property iPlayerCaughtStealing = 1236 Auto Const
Int Property iAllAccessGranted = 1235 Auto Const
Int Property iComputerAccessGranted = 1271 Auto Const
ReferenceAlias Property Sean Auto Const mandatory
ReferenceAlias Property DrLane Auto Const mandatory
ReferenceAlias Property GuardAlias Auto Const mandatory
ReferenceAlias Property Staff01 Auto Const mandatory
ReferenceAlias Property Staff02 Auto Const mandatory
ReferenceAlias Property DrLaneTerminal Auto Const mandatory
ReferenceAlias Property RothiciteShipment Auto Const mandatory
ReferenceAlias Property RothiciteShipmentPost Auto Const mandatory
Scene Property RI06_1258_Sean_CaughtStealingScene Auto Const mandatory
Scene Property RI06_1258_DrLane_CaughtStealingScene Auto Const mandatory
MiscObject Property RI06_RothiciteShipment Auto Const mandatory
Faction Property RI06_SecureWingFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function SeanStartTimer()
  Self.SeanTimer()
EndFunction

Function DrLaneStartTimer()
  Self.DrLaneTimer()
EndFunction

Function SeanRegisterLOSGain()
  Self.RegisterForDirectLOSGain(Sean.GetRef(), Game.GetPlayer() as ObjectReference, "", "")
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)
EndFunction

Function DrLaneRegisterLOSGain()
  Self.RegisterForDirectLOSGain(DrLane.GetRef(), Game.GetPlayer() as ObjectReference, "", "")
  Game.GetPlayer().RemoveFromFaction(RI06_SecureWingFaction)
EndFunction

Function SeanTimer()
  Self.StartTimer(60.0, 1)
EndFunction

Function DrLaneTimer()
  Self.StartTimer(60.0, 2)
EndFunction

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
  If akViewer == Sean.GetRef()
    Self.SetStage(iSeanCallsSecurityStage)
  EndIf
  If akViewer == DrLane.GetRef()
    Self.SetStage(iDrLaneCallsSecurityStage)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1
    If Sean.GetActorRef().HasDetectionLOS(Game.GetPlayer() as ObjectReference)
      Self.SetStage(iSeanCallsSecurityStage)
    Else
      Self.SeanRegisterLOSGain()
    EndIf
  EndIf
  If aiTimerID == 2
    If DrLane.GetActorRef().HasDetectionLOS(Game.GetPlayer() as ObjectReference)
      Self.SetStage(iDrLaneCallsSecurityStage)
    Else
      Self.DrLaneRegisterLOSGain()
    EndIf
  EndIf
EndEvent

Function CheckForAccess(ObjectReference akObjectRef)
  Actor PlayerRef = Game.GetPlayer()
  If akObjectRef == RothiciteShipment.GetRef()
    If !Self.GetStageDone(iAllAccessGranted)
      Self.CheckForLOS()
      PlayerRef.RemoveItem(RI06_RothiciteShipment as Form, 99, True, None)
      PlayerRef.AddAliasedItem(RI06_RothiciteShipment as Form, RothiciteShipmentPost as Alias, 1, True)
    EndIf
  EndIf
  If akObjectRef == DrLaneTerminal.GetRef()
    If !Self.GetStageDone(iAllAccessGranted) && !Self.GetStageDone(iComputerAccessGranted)
      Self.CheckForLOS()
    EndIf
  EndIf
EndFunction

Function CheckForLOS()
  Actor PlayerRef = Game.GetPlayer()
  If Sean.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference)
    Self.SetStage(iPlayerCaughtStealing)
    RI06_1258_Sean_CaughtStealingScene.Start()
  EndIf
  If DrLane.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference)
    Self.SetStage(iPlayerCaughtStealing)
    RI06_1258_DrLane_CaughtStealingScene.Start()
  EndIf
  If Staff01.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference) || Staff02.GetActorRef().HasDetectionLOS(PlayerRef as ObjectReference)
    Self.SetStage(iPlayerCaughtStealing)
  EndIf
EndFunction
