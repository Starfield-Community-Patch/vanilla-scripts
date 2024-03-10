ScriptName MQ104BComputerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ104BSensorArrayMSG_01_Main Auto Const mandatory
Message Property MQ104BSensorArrayMSG_02_ReplacePowerFail Auto Const mandatory
Message Property MQ104BSensorArrayMSG_02_ReplacePowerSuccess Auto Const mandatory
Message Property MQ104BSensorArrayMSG_03_OutpostSuccess Auto Const mandatory
Message Property MQ104BSensorArrayMSG_04_InfoSuccess Auto Const mandatory
MiscObject Property Mfg_Power_Circuit Auto Const mandatory
Int Property NumReqPowerCircuit = 3 Auto Const
Int Property ReplacePowerSuccessStage = 40 Auto Const
Int Property ReplacePowerFailStage = 45 Auto Const
Int Property OutpostSuccessStage = 50 Auto Const
Int Property InfoSuccessStage = 55 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Quest MQ104B = Self.GetOwningQuest()
    Int iButtonPressed = 0
    iButtonPressed = MQ104BSensorArrayMSG_01_Main.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    If iButtonPressed == 1
      MQ104BSensorArrayMSG_02_ReplacePowerFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      MQ104B.SetStage(ReplacePowerFailStage)
    ElseIf iButtonPressed == 2
      MQ104BSensorArrayMSG_03_OutpostSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      MQ104B.SetStage(OutpostSuccessStage)
    ElseIf iButtonPressed == 3
      MQ104BSensorArrayMSG_04_InfoSuccess.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
      MQ104B.SetStage(InfoSuccessStage)
    EndIf
  EndIf
EndEvent
