ScriptName Fragments:Packages:PF_FC_Neon_ESNeshar_ExitPack_0022D844 Extends Package Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCNeonEstablishingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  DialogueFCNeonEstablishingScene.SetStage(110)
EndFunction
