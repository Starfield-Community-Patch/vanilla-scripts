ScriptName Fragments:Packages:PF_CF01UCSGuard01EscortEleva_000E66F5 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property CF01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  CF01.SetStage(208)
EndFunction
