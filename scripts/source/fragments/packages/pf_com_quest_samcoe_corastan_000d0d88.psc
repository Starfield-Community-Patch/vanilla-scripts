ScriptName Fragments:Packages:PF_COM_Quest_SamCoe_CoraStan_000D0D88 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC123VictorCompoundQuest Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  LC123VictorCompoundQuest.SetStage(5)
EndFunction
