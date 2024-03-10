ScriptName Fragments:Terminals:TERM__01000FBD Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ203A Auto Const mandatory
Quest Property MQ206D Auto Const

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  MQ206D.SetStage(639)
EndFunction
