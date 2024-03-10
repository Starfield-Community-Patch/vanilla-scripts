ScriptName OE_KT_IncomingStormTerminalScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property OE_KT_IncomingStormGenA_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenB_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenC_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormTotalMoves_Global Auto Const mandatory

;-- Functions ---------------------------------------

Function PuzzleStart()
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenA_Global)
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenB_Global)
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenC_Global)
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormTotalMoves_Global)
EndFunction

Function CheckPuzzle()
  OE_KT_IncomingStormTotalMoves_Global.Mod(-1.0)
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenA_Global)
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenB_Global)
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenC_Global)
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormTotalMoves_Global)
  If OE_KT_IncomingStormGenA_Global.GetValueInt() > 100 || OE_KT_IncomingStormGenB_Global.GetValueInt() > 100 || OE_KT_IncomingStormGenC_Global.GetValueInt() > 100
    Self.SetStage(300)
  ElseIf OE_KT_IncomingStormTotalMoves_Global.GetValueInt() == 0
    If OE_KT_IncomingStormGenA_Global.GetValueInt() == 60 && OE_KT_IncomingStormGenB_Global.GetValueInt() == 60 && OE_KT_IncomingStormGenC_Global.GetValueInt() == 60
      Self.SetStage(200)
    Else
      Self.SetStage(300)
    EndIf
  EndIf
EndFunction
