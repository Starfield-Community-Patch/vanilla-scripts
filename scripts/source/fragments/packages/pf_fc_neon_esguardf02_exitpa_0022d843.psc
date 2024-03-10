ScriptName Fragments:Packages:PF_FC_Neon_ESGuardF02_ExitPa_0022D843 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeonEstablishingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  DialogueFCNeonEstablishingScene.SetStage(120)
EndFunction
