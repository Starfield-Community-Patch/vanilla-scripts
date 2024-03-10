ScriptName Fragments:Quests:QF_COM_Companion_SamCoe_0026C5ED Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory
Quest Property COM_Quest_SamCoe_Commitment Auto Const mandatory
Perk Property Crew_Geology Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
Perk Property CREW_Ship_Piloting Auto Const mandatory
Perk Property Crew_RifleCertification Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0105_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0215_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0315_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetStage(300)
EndFunction

Function Fragment_Stage_0505_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0515_Item_00()
  Self.SetStage(500)
EndFunction

Function Fragment_Stage_0605_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0615_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetStage(600)
EndFunction

Function Fragment_Stage_0650_Item_00()
  If Self.IsObjectiveDisplayed(798) == True
    Self.SetObjectiveCompleted(798, True)
  EndIf
  COM_Quest_SamCoe_Q01.SetStage(100)
EndFunction

Function Fragment_Stage_0750_Item_00()
  COM_Quest_SamCoe_Q01.SetStage(1600)
EndFunction

Function Fragment_Stage_0798_Item_00()
  Self.SetObjectiveDisplayed(798, True, False)
EndFunction

Function Fragment_Stage_0799_Item_00()
  Self.SetObjectiveCompleted(798, True)
EndFunction

Function Fragment_Stage_0801_Item_00()
  Self.SetObjectiveDisplayed(801, True, False)
EndFunction

Function Fragment_Stage_0802_Item_00()
  Self.SetObjectiveCompleted(801, True)
  Self.SetObjectiveDisplayed(802, True, False)
EndFunction

Function Fragment_Stage_0820_Item_00()
  Self.SetObjectiveCompleted(802, True)
EndFunction

Function Fragment_Stage_0825_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  Self.SetStage(820)
  Self.SetObjectiveCompleted(802, True)
  kmyQuest.StartCommitmentQuest()
EndFunction
