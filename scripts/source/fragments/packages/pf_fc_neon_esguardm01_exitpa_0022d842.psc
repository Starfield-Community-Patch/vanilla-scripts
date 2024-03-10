ScriptName Fragments:Packages:PF_FC_Neon_ESGuardM01_ExitPa_0022D842 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeonEstablishingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  DialogueFCNeonEstablishingScene.SetStage(130)
EndFunction
