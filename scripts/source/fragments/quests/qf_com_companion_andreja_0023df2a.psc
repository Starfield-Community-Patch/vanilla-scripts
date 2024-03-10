ScriptName Fragments:Quests:QF_COM_Companion_Andreja_0023DF2A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Quest_Andreja_Q01 Auto Const mandatory
Quest Property COM_Quest_Andreja_Commitment Auto Const mandatory
Quest Property MQ104A Auto Const mandatory
ActorValue Property COM_Affinity Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
Perk Property Crew_Ballistics Auto Const mandatory
Perk Property Crew_Stealth Auto Const mandatory
Perk Property Crew_Ship_Weapons_Energy Auto Const mandatory
Perk Property Crew_ParticleBeams Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Alias_Andreja.GetActorRef().SetValue(COM_Affinity, 50.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  MQ104A.SetStage(50)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetStage(95)
EndFunction

Function Fragment_Stage_0091_Item_00()
  Self.SetStage(95)
EndFunction

Function Fragment_Stage_0092_Item_00()
  Self.SetStage(95)
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ104A.SetStage(55)
EndFunction

Function Fragment_Stage_0155_Item_00()
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetStage(150)
EndFunction

Function Fragment_Stage_0165_Item_00()
  Self.SetStage(150)
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

Function Fragment_Stage_0405_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0415_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetStage(400)
EndFunction

Function Fragment_Stage_0750_Item_00()
  COM_Quest_Andreja_Q01.SetStage(1000)
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest
  com_companionquestscript kmyQuest = __temp as com_companionquestscript
  kmyQuest.StartCommitmentQuest()
EndFunction

Function Fragment_Stage_6000_Item_00()
  Alias_Andreja.GetActorRef().RemoveKeyword(SQ_Followers_UseFollowPlayerCustom)
EndFunction
