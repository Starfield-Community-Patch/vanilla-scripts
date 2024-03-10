ScriptName Fragments:Quests:QF_FC_EncryptedSlateQuest_001D5AAF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property FC_EncryptedSlatesCollectedAV Auto Const mandatory
Quest Property FC05 Auto Const mandatory
Quest Property FC06 Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
Book Property FC05_MarcoDataslate Auto Const mandatory
Book Property FC06_MayaDataslate Auto Const mandatory
Quest Property FC08 Auto Const mandatory
ReferenceAlias Property Alias_MarcoSlate Auto Const mandatory
ReferenceAlias Property Alias_MayaSlate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0400_Item_00()
  ObjectReference Player = Alias_Player.GetReference()
  If Player.GetValue(FC_EncryptedSlatesCollectedAV) == 2.0
    FC05.SetStage(2100)
    FC06.SetStage(2000)
    Self.SetStage(1000)
  ElseIf FC05.GetStageDone(2000)
    FC05.SetStage(2100)
  Else
    FC06.SetStage(2000)
  EndIf
EndFunction

Function Fragment_Stage_0500_Item_00()
  ObjectReference Player = Alias_Player.GetReference()
  If FC05.IsRunning()
    FC05.SetStage(2100)
  ElseIf FC06.IsRunning()
    FC06.SetStage(2000)
  EndIf
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  FC08.Start()
  Self.Stop()
EndFunction
