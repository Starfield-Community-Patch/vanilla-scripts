ScriptName Fragments:Quests:QF_City_Neon_Drug_Game_0021A1FE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property City_Neon_Drug_Game_200_AssemblyComplete Auto Const mandatory
Message Property Neon_Drug_05_TimedOut Auto Const mandatory
ReferenceAlias Property Alias_ConveyorBelt Auto Const mandatory
Message Property Neon_Drug_06_TimedOutFollowup Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0120_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0280_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetStage(120)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_ConveyorBelt.GetRef().PlayAnimation("play01")
EndFunction

Function Fragment_Stage_0200_Item_00()
  Neon_Drug_06_TimedOutFollowup.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Quest __temp = Self as Quest
  city_neon_druggamescript kmyQuest = __temp as city_neon_druggamescript
  kmyQuest.ValidateItemsUsed()
EndFunction

Function Fragment_Stage_0300_Item_00()
  City_Neon_Drug_Game_200_AssemblyComplete.Start()
  Self.SetStage(350)
EndFunction

Function Fragment_Stage_0325_Item_00()
  Neon_Drug_05_TimedOut.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest
  city_neon_druggamescript kmyQuest = __temp as city_neon_druggamescript
  kmyQuest.RewardPlayer()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  city_neon_druggamescript kmyQuest = __temp as city_neon_druggamescript
  kmyQuest.Cleanup()
EndFunction
