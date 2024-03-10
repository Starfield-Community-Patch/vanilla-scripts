ScriptName Fragments:Quests:QF_City_NA_Aquilus01_0007BDBF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_NA_Aquilus01Misc Auto Const mandatory
ReferenceAlias Property Alias_Target_Book Auto Const mandatory
GlobalVariable Property Settlement_Convo_NPC_Distance Auto Const mandatory
ReferenceAlias Property Alias_Aquilus Auto Const mandatory
Quest Property MQ206B Auto Const mandatory
ReferenceAlias Property Alias_Marcus Auto Const mandatory
ReferenceAlias Property Alias_Terrance Auto Const mandatory
ReferenceAlias Property Alias_Catherine Auto Const mandatory
ReferenceAlias Property Alias_Andreas Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  If Alias_Aquilus.GetReference().GetDistance(Game.GetPlayer() as ObjectReference) < Settlement_Convo_NPC_Distance.GetValue()
    If MQ206B.IsRunning() == False
      City_NA_Aquilus01Misc.Start()
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Terrance.GetReference().Disable(False)
  Alias_Andreas.GetReference().Disable(False)
  Self.Stop()
EndFunction
