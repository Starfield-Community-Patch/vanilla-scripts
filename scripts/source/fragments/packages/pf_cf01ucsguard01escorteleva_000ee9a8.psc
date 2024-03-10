ScriptName Fragments:Packages:PF_CF01UCSGuard01EscortEleva_000EE9A8 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  CF01.SetStage(190)
EndFunction
