ScriptName SQ_PlayerShipArmillaryScreenScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
Message Property MQPlaceArmillaryShipScreenMSGBox Auto Const mandatory
Message Property MQRemoveArmillaryShipScreenMSGBox Auto Const mandatory
Message Property MQBlockArmillaryShipScreenMSGBox Auto Const mandatory
ReferenceAlias Property PlayerShipArmillary Auto Const mandatory
ReferenceAlias Property MQ00_Armillary Auto Const mandatory
Quest Property MQ204 Auto Const mandatory
Quest Property MQ404 Auto Const mandatory
Quest Property MQ305 Auto Const mandatory
Int Property MQ204_PlayerSecuresArmillaryStage = 620 Auto Const
Int Property MQ404_PlayerSecuresArmillaryStage = 120 Auto Const
Quest Property MQ00 Auto Const mandatory
ReferenceAlias Property MQ00_ArmillaryMountOrScreen Auto Const mandatory
Keyword Property ObjectTypeMQArtifact Auto Const mandatory
Message Property ArmillaryNoArtifactsAddedMSG Auto Const mandatory
ReferenceAlias Property HomeShipArmillaryScreen Auto Const mandatory
Furniture Property PilotSeatStarborn Auto Const mandatory
{ the ship armillary screen on a starborn ship is the pilot seat }
wwiseevent Property WwiseEvent_AMBArtifactArmillaryShipInstall Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryShipUninstall Auto Const mandatory
wwiseevent Property WwiseEvent_AMBArtifactArmillaryShipAddArtifact Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef()
  ObjectReference ArmillaryScreenTriggerREF = Self.GetRef()
  ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef()
  Utility.Wait(1.0)
  If ArmillaryREF.IsEnabled()
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form
      HomeShipArmillaryScreenREF.PlayAnimation("Play01")
    Else
      HomeShipArmillaryScreenREF.PlayAnimation("Stage2")
    EndIf
  ElseIf MQ00_Armillary.GetRef() == ArmillaryREF
    ArmillaryREF.Enable(False)
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form
      HomeShipArmillaryScreenREF.PlayAnimation("Play01")
    Else
      HomeShipArmillaryScreenREF.PlayAnimation("Stage2")
    EndIf
  ElseIf HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form
    HomeShipArmillaryScreenREF.PlayAnimation("Play02")
  Else
    HomeShipArmillaryScreenREF.PlayAnimation("Stage1")
  EndIf
  If MQAlllowArmillaryGravDrive.GetValueInt() >= 1 && ArmillaryScreenTriggerREF.IsDisabled()
    ArmillaryScreenTriggerREF.Enable(False)
  EndIf
EndEvent

Function PlaceArmillaryMessage()
  Actor PlayerREF = Game.GetPlayer()
  Int ButtonPressed = MQPlaceArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef()
  ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef()
  If ButtonPressed == 1
    WwiseEvent_AMBArtifactArmillaryShipInstall.Play(PlayerREF as ObjectReference, None, None)
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form
      HomeShipArmillaryScreenREF.PlayAnimation("Play01")
    Else
      HomeShipArmillaryScreenREF.PlayAnimation("Stage2")
    EndIf
    ArmillaryREF.Enable(False)
    (ArmillaryREF as armillaryscript).BuildArmillary(PlayerREF, Self.GetRef())
  EndIf
EndFunction

Function ArmillaryInShipMessage()
  Actor PlayerREF = Game.GetPlayer()
  Int ButtonPressed = MQRemoveArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  ObjectReference ArmillaryREF = PlayerShipArmillary.GetRef()
  ObjectReference HomeShipArmillaryScreenREF = HomeShipArmillaryScreen.GetRef()
  If ButtonPressed == 1
    WwiseEvent_AMBArtifactArmillaryShipAddArtifact.Play(PlayerREF as ObjectReference, None, None)
    If PlayerREF.GetItemCount(ObjectTypeMQArtifact as Form) > 0
      (ArmillaryREF as armillaryscript).BuildArmillary(PlayerREF, Self.GetRef())
    Else
      ArmillaryNoArtifactsAddedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    EndIf
  ElseIf ButtonPressed == 2
    WwiseEvent_AMBArtifactArmillaryShipUninstall.Play(PlayerREF as ObjectReference, None, None)
    If HomeShipArmillaryScreenREF.GetBaseObject() != PilotSeatStarborn as Form
      HomeShipArmillaryScreenREF.PlayAnimation("Play02")
    Else
      HomeShipArmillaryScreenREF.PlayAnimation("Stage1")
    EndIf
    (ArmillaryREF as armillaryscript).PackupArmillary(PlayerREF)
    ArmillaryREF.Disable(False)
  EndIf
EndFunction

;-- State -------------------------------------------
Auto State AllowInputState

  Event OnActivate(ObjectReference akActionRef)
    Actor PlayerREF = Game.GetPlayer()
    ObjectReference ArmillaryMountOrScreenREF = MQ00_ArmillaryMountOrScreen.GetRef()
    ObjectReference mySelfREF = Self.GetRef()
    If akActionRef == PlayerREF as ObjectReference
      If ArmillaryMountOrScreenREF == None
        Self.PlaceArmillaryMessage()
      ElseIf ArmillaryMountOrScreenREF == mySelfREF
        Self.ArmillaryInShipMessage()
      Else
        MQBlockArmillaryShipScreenMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    EndIf
    Self.GotoState("AllowInputState")
  EndEvent
EndState

;-- State -------------------------------------------
State ProcessingState

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState
