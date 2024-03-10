ScriptName Fragments:Terminals:TERM_RL048CaptainTerminal_00181B03 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Quest Property DR018_EavesdroppingScene01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkCustom01).Unlock(False)
EndFunction

Function Fragment_Terminal_03(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkCustom02).Unlock(False)
  Utility.wait(1.0)
  akTerminalRef.GetLinkedRef(LinkCustom02).SetOpen(True)
  Utility.wait(2.0)
  DR018_EavesdroppingScene01.SetStage(20)
EndFunction
