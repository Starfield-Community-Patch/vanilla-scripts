ScriptName BE_KT02_GravitySwitchScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
bescript Property BE_KT02 Auto Const mandatory
wwiseevent Property PowerON Auto Const mandatory
wwiseevent Property PowerOFF Auto Const mandatory
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Minibot Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function GravitySwitch()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  Float myGravity = PlayerRef.GetGravityScale()
  If myGravity == 0.0
    BE_KT02.SetShipGravity(1.0)
    PowerON.Play(PlayerRef, None, None)
    Alias_EnableMarker.GetRef().EnableNoWait(False)
    Alias_AllCrew.EvaluateAll()
  Else
    BE_KT02.SetShipGravity(0.0)
    PowerOFF.Play(PlayerRef, None, None)
    Alias_EnableMarker.GetRef().DisableNoWait(False)
    Alias_Minibot.GetActorRef().EvaluatePackage(False)
  EndIf
  Self.BlockActivation(False, False)
  Self.goToState("waiting")
EndFunction

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      Self.goToState("Busy")
      Self.BlockActivation(True, True)
      Self.GravitySwitch()
    EndIf
  EndEvent
EndState
