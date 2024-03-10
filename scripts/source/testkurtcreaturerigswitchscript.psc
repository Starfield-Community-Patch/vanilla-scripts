ScriptName TestKurtCreatureRigSwitchScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property TestKurtCreatureRigMessage Auto Const mandatory
{ message box for player choices }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int messageIndex = TestKurtCreatureRigMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  If messageIndex > -1
    testkurtcreaturebehaviorsswitchscript myBehaviorSwitch = Self.GetLinkedRef(None) as testkurtcreaturebehaviorsswitchscript
    If myBehaviorSwitch
      myBehaviorSwitch.ChangeRig(messageIndex)
    EndIf
  EndIf
EndEvent
