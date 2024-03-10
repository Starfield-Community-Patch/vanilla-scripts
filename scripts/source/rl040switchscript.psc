ScriptName RL040SwitchScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myEnableMarker Auto Const mandatory
ObjectReference Property PirateSceneTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Self.GetReference().BlockActivation(True, True)
  PirateSceneTrigger.Disable(False)
  myEnableMarker.Enable(False)
  Self.GetOwningQuest().SetStage(30)
EndEvent
