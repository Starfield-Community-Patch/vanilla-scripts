ScriptName PowerCellReceptacle Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Power_Cell Auto Const
Message Property PowerCellRequiredMessage Auto Const mandatory
Message Property PowerCellActiveMessage Auto Const mandatory
Message Property PowerCellMissingMessage Auto Const
Message Property PowerCellFullMessage Auto Const
wwiseevent Property SoundPowerUp Auto Const mandatory
ActorValue Property PowerCellReceptacleAV Auto Const

;-- Functions ---------------------------------------

Function InsertPowerCell(ObjectReference akActionRef)
  akActionRef.RemoveItem(Power_Cell as Form, 1, False, None)
  Self.BlockActivation(False, False)
  Self.Activate(Self as ObjectReference, False)
  Self.BlockActivation(True, False)
  Self.SetActivateTextOverride(PowerCellActiveMessage)
  SoundPowerUp.Play(akActionRef, None, None)
  Self.GotoState("HasPowerCell")
  If PowerCellReceptacleAV
    Self.SetValue(PowerCellReceptacleAV, 1.0)
  EndIf
EndFunction

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
State HasPowerCell

  Event OnActivate(ObjectReference akActionRef)
    PowerCellFullMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndEvent
EndState

;-- State -------------------------------------------
Auto State NoPowerCell

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Busy")
    If akActionRef == Game.getplayer() as ObjectReference
      If akActionRef.GetItemCount(Power_Cell as Form) >= 1
        Self.InsertPowerCell(akActionRef)
      Else
        PowerCellMissingMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        Self.GotoState("NoPowerCell")
      EndIf
    EndIf
  EndEvent

  Event OnLoad()
    Self.SetActivateTextOverride(PowerCellRequiredMessage)
    Self.BlockActivation(True, False)
  EndEvent
EndState
