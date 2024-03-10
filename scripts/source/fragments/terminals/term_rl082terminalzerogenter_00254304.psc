ScriptName Fragments:Terminals:TERM_RL082TerminalZeroGEnter_00254304 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RL082_EavesdroppingSceneTest Auto Const
ObjectReference Property AirlockDoor01 Auto Const
ObjectReference Property AirlockDoor02 Auto Const
ObjectReference Property HavokObject01 Auto Const
Cell Property RL082TAWarehouse Auto Const
Int Property currentElement Auto Const

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  AirlockDoor01.lock(True, False, True)
  AirlockDoor01.SetLockLevel(253)
  AirlockDoor02.unlock(False)
  RL082TAWarehouse.setGravityScale(0.0)
EndFunction
