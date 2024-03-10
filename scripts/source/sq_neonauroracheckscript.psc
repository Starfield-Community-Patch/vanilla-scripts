ScriptName SQ_NeonAuroraCheckScript Extends Quest
{ watch for player to have or pick up Aurora while in Neon }

;-- Variables ---------------------------------------
Int CheckForAuroraTimerID = 1 Const
inputenablelayer myEnableLayer

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard CheckForAuroraGuard

;-- Properties --------------------------------------
Location Property CityNeonLocation Auto Const mandatory
Keyword Property LocTypeSettlement Auto Const mandatory
Potion Property Drug_Aurora Auto Const mandatory
ReferenceAlias Property ActiveCompanion Auto Const mandatory
{ companion alias - from SQ_Companion }
ReferenceAlias Property PlayerShip Auto Const mandatory
{ current ship - from SQ_PlayerShip }
ReferenceAlias Property Player Auto Const mandatory
{ player alias }
ActorValue Property AuroraBlockingFastTravel Auto Const mandatory
{ use to give custom fast travel blocked message for this situation }

;-- Functions ---------------------------------------

Event OnQuestInit()
  myEnableLayer = inputenablelayer.Create()
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange")
  Self.StartAuroraCheck(True)
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Bool newLocationInNeon = akNewLoc.IsSameLocation(CityNeonLocation, LocTypeSettlement)
  If newLocationInNeon == False
    Self.StartAuroraCheck(False)
  EndIf
EndEvent

Function StartAuroraCheck(Bool bStart)
  Actor playerRef = Game.GetPlayer()
  Actor companionRef = ActiveCompanion.GetActorRef()
  If bStart
    Self.CheckForAurora()
    Self.AddInventoryEventFilter(Drug_Aurora as Form)
    Self.RegisterForRemoteEvent(Player as ScriptObject, "OnItemAdded")
    Self.RegisterForRemoteEvent(Player as ScriptObject, "OnItemRemoved")
    Self.RegisterForRemoteEvent(ActiveCompanion as ScriptObject, "OnItemAdded")
    Self.RegisterForRemoteEvent(ActiveCompanion as ScriptObject, "OnItemRemoved")
  Else
    Self.BlockFastTravel(playerRef, False)
    myEnableLayer.Delete()
    myEnableLayer = None
    Self.Stop()
  EndIf
EndFunction

Event ReferenceAlias.OnItemAdded(ReferenceAlias akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.StartTimer(0.5, CheckForAuroraTimerID)
EndEvent

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Self.StartTimer(0.5, CheckForAuroraTimerID)
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == CheckForAuroraTimerID
    Self.CheckForAurora()
  EndIf
EndEvent

Function CheckForAurora()
  Guard CheckForAuroraGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Actor playerRef = Game.GetPlayer()
    Actor companionRef = ActiveCompanion.GetActorRef()
    If playerRef.GetItemCount(Drug_Aurora as Form) > 0 || (companionRef as Bool && companionRef.GetItemCount(Drug_Aurora as Form) > 0)
      Self.BlockFastTravel(playerRef, True)
    Else
      Self.BlockFastTravel(playerRef, False)
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction

Function BlockFastTravel(Actor playerRef, Bool shouldBlock)
  If shouldBlock
    myEnableLayer.EnableFastTravel(False)
    playerRef.SetValue(AuroraBlockingFastTravel, 1.0)
  Else
    myEnableLayer.EnableFastTravel(True)
    playerRef.SetValue(AuroraBlockingFastTravel, 0.0)
  EndIf
EndFunction
