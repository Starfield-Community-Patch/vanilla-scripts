ScriptName Fragments:Packages:PF_City_CY_StartUp01_ErickTo_000B214C Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueCydonia Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  DialogueCydonia.SetStage(1550)
EndFunction
