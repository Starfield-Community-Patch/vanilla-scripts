ScriptName Fragments:Quests:QF_DialogueFCClinic_IntroPos_0014A876 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueFCClinic Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  DialogueFCClinic.SetStage(30)
  Self.Stop()
EndFunction
