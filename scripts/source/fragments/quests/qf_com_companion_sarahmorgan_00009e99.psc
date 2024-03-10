ScriptName Fragments:Quests:QF_COM_Companion_SarahMorgan_00009E99 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
Perk Property Crew_Botany Auto Const mandatory
Perk Property Crew_Lasers Auto Const mandatory
Perk Property CREW_Ship_Astrodynamics Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory

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

Function Fragment_Stage_0405_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0415_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0705_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0715_Item_00()
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0750_Item_00()
  SQ_Followers.SetRoleActive(Alias_SarahMorgan.GetActorReference(), True, True, 0.0, 0.0)
  COM_Quest_SarahMorgan_Q01.SetStage(1000)
EndFunction
