ScriptName StarterHomeDoorScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bDoorOpen = True
Float fPaymentTimestamp = -7.0

;-- Properties --------------------------------------
Message Property TraitStarterHome_DoorMortgageMessage Auto Const mandatory
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If !bDoorOpen
    Int messageIndex = TraitStarterHome_DoorMortgageMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If messageIndex > -1
      If messageIndex == 0
        Game.GetPlayer().RemoveItem(Credits as Form, 500, False, None)
        fPaymentTimestamp = Utility.GetCurrentGameTime() + 7.0
        bDoorOpen = True
        Self.GetRef().Lock(False, False, True)
      ElseIf messageIndex == 1
        Self.GetOwningQuest().SetStage(200)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnLoad()
  If !Self.GetOwningQuest().GetStageDone(400)
    Float currentGameTime = Utility.GetCurrentGameTime()
    If currentGameTime >= fPaymentTimestamp
      bDoorOpen = False
      Self.GetRef().Lock(True, False, True)
    EndIf
  Else
    bDoorOpen = True
    Self.GetRef().Lock(False, False, True)
    Self.GetOwningQuest().SetStage(9000)
  EndIf
  If Self.GetOwningQuest().GetStageDone(500)
    Self.GetRef().Lock(True, False, True)
  EndIf
EndEvent
