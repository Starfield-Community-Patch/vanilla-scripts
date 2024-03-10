ScriptName LC102LifeSupportSequenceQuestScript Extends Quest
{ Quest for life support sequence in CF04. Controls FX for the LC102 life support machines, and the state change for the lockdown sequence. }

;-- Variables ---------------------------------------
Int lifeSupportMachineActivations = 0
Int maxLifeSupportMachineActivations = 3

;-- Properties --------------------------------------
Group AutofillProperties
  ReferenceAlias Property Alias_LifeSupportMachine01_FXEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine02_FXEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine03_FXEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LockdownEnableMarker Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const mandatory
  ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const mandatory
EndGroup

Group TimingProperties
  Float Property LockdownWaitSeconds = 2.0 Auto Const mandatory
EndGroup

Group QuestProperties
  Quest Property CF04 Auto Const mandatory
  Int Property stageToSetOnMachine01Disabled = 121 Auto Const mandatory
  Int Property stageToSetOnMachine02Disabled = 122 Auto Const mandatory
  Int Property stageToSetOnMachine03Disabled = 123 Auto Const mandatory
  Int Property stageToSetOnInitiateLockdown = 130 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function IncrementLifeSupportMachineActivations()
  lifeSupportMachineActivations += 1
EndFunction

Function RegisterForLifeSupportMachineActivations()
  ObjectReference lifeSupportMachine01Activator = Alias_LifeSupportMachine01Activator.GetRef()
  ObjectReference lifeSupportMachine02Activator = Alias_LifeSupportMachine02Activator.GetRef()
  ObjectReference lifeSupportMachine03Activator = Alias_LifeSupportMachine03Activator.GetRef()
  Self.RegisterForRemoteEvent(lifeSupportMachine01Activator as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(lifeSupportMachine02Activator as ScriptObject, "OnActivate")
  Self.RegisterForRemoteEvent(lifeSupportMachine03Activator as ScriptObject, "OnActivate")
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference lifeSupportMachine01Activator = Alias_LifeSupportMachine01Activator.GetRef()
  ObjectReference lifeSupportMachine02Activator = Alias_LifeSupportMachine02Activator.GetRef()
  ObjectReference lifeSupportMachine03Activator = Alias_LifeSupportMachine03Activator.GetRef()
  If akSender == lifeSupportMachine01Activator
    Self.DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine01_FXEnableMarker.GetRef(), stageToSetOnMachine01Disabled)
  ElseIf akSender == lifeSupportMachine02Activator
    Self.DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine02_FXEnableMarker.GetRef(), stageToSetOnMachine02Disabled)
  ElseIf akSender == lifeSupportMachine03Activator
    Self.DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine03_FXEnableMarker.GetRef(), stageToSetOnMachine03Disabled)
  EndIf
EndEvent

Function DeactivateLifeSupportMachine(ObjectReference lifeSupportMachineActivator, ObjectReference lifeSupportMachine_FXEnableMarker, Int stageToSet)
  Self.UnregisterForRemoteEvent(lifeSupportMachineActivator as ScriptObject, "OnActivate")
  lifeSupportMachine_FXEnableMarker.Disable(False)
  Self.IncrementLifeSupportMachineActivations()
  CF04.SetStage(stageToSet)
  If lifeSupportMachineActivations == maxLifeSupportMachineActivations
    Self.InitiateLockdown()
  EndIf
EndFunction

Function InitiateLockdown()
  Utility.Wait(LockdownWaitSeconds)
  Alias_LockdownEnableMarker.GetRef().Enable(False)
  CF04.SetStage(stageToSetOnInitiateLockdown)
EndFunction
