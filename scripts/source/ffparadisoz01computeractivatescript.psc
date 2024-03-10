ScriptName FFParadisoZ01ComputerActivateScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property FixComputerStage = 300 Auto Const
Int Property ComputerFixedStage = 460 Auto Const
Perk Property Security Auto Const mandatory
Quest Property FFParadisoZ01 Auto Const mandatory
Message Property FFParadisoZ01_ComputerMSG Auto Const mandatory
Message Property FFParadisoZ01_ComputerMSGFail Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If FFParadisoZ01.GetStageDone(FixComputerStage) && !FFParadisoZ01.GetStageDone(ComputerFixedStage)
    Self.BlockActivation(False, False)
  Else
    Self.BlockActivation(True, True)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If Game.GetPlayer().HasPerk(Security) && FFParadisoZ01.GetStageDone(FixComputerStage) && !FFParadisoZ01.GetStageDone(ComputerFixedStage)
    FFParadisoZ01_ComputerMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Else
    FFParadisoZ01_ComputerMSGFail.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  EndIf
EndEvent
