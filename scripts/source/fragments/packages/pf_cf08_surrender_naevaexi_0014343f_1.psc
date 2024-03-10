ScriptName Fragments:Packages:PF_CF08_Surrender_NaevaExi_0014343F_1 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC088_Vigilance Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  LC088_Vigilance.SetStage(1112)
EndFunction
