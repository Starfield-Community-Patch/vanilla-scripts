ScriptName TestNPCUseTerminalScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property TestActor Auto Const
GlobalVariable Property TestNPCUseTerminalGlobal Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  TestNPCUseTerminalGlobal.SetValueInt(1)
  TestActor.EvaluatePackage(False)
EndEvent
