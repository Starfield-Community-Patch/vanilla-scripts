ScriptName MQ301ReleaseArtifactSwitchScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property MQ301PrototypeKey Auto Const mandatory
Message Property MQ301_ReleaseSwitchActivateMSG Auto Const mandatory
Message Property MQ301_ReleaseSwitchNotification Auto Const mandatory
Message Property MQ301_ReleaseSwitchNameMSG Auto Const mandatory
Int Property ReleaseArtifactStage = 160 Auto Const

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent

  Event OnLoad()
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State waitingforPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference
      If akActionRef.GetItemCount(MQ301PrototypeKey as Form) >= 1
        Self.GotoState("HasBeenTriggered")
        ObjectReference mySelfREF = Self.GetRef()
        mySelfREF.Activate(akActionRef, True)
        mySelfREF.BlockActivation(True, True)
        Self.GetOwningQuest().SetStage(ReleaseArtifactStage)
      Else
        MQ301_ReleaseSwitchNotification.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      EndIf
    EndIf
  EndEvent

  Event OnLoad()
    ObjectReference mySelfREF = Self.GetRef()
    mySelfREF.BlockActivation(True, False)
    mySelfREF.SetActivateTextOverride(MQ301_ReleaseSwitchActivateMSG)
    mySelfREF.SetOverrideName(MQ301_ReleaseSwitchNameMSG)
  EndEvent
EndState
