ScriptName Fragments:Quests:QF_MQ207C_Support_0027E24A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
sq_parentscript Property SQ_Parent Auto Const mandatory
Quest Property MQ207C Auto Const mandatory
Scene Property MQ207C_110_EntranceIntercom Auto Const mandatory
Perk Property MQ207C_BarakovaPriceModPerk Auto Const mandatory
Book Property MQ207C_Nishina01_DrBarakovaSlate_II Auto Const mandatory
Message Property MQ207C_SurveyDataDownloadedMessage Auto Const mandatory
Keyword Property PlanetTrait19PsychotropicBiota Auto Const mandatory
LeveledItem Property MQ207C_LL_Weapon_Cataxi Auto Const mandatory
LeveledItem Property MQ207C_LL_MedPacks Auto Const mandatory
LeveledItem Property MQ207C_LL_MedSupplies Auto Const mandatory
LeveledItem Property MQ207C_LL_MinorReward_Credits Auto Const mandatory
MiscObject Property MQ207C_ProbeControlUnit Auto Const mandatory
ReferenceAlias Property Alias_Nishina02_I_ScientistEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Nishina02_I_ScientistDisableMarker Auto Const mandatory
RefCollectionAlias Property Alias_Nishina02_SkillMagazines Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0022_Item_00()
  Game.GetPlayer().AddItem(MQ207C_LL_Weapon_Cataxi as Form, 1, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor player = Game.GetPlayer()
  sq_parentscript:planettraitdata traitData = SQ_Parent.FindMatchingPlanetTraitForKeyword(PlanetTrait19PsychotropicBiota, player.GetCurrentPlanet())
  SQ_Parent.UpdatePlanetTraitDiscovery(player as ObjectReference, traitData, 1)
  MQ207C_SurveyDataDownloadedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().AddItem(MQ207C_LL_MinorReward_Credits as Form, 1, False)
EndFunction

Function Fragment_Stage_0031_Item_00()
  Actor player = Game.GetPlayer()
  player.RemoveItem(MQ207C_ProbeControlUnit as Form, 1, False, None)
  player.AddItem(MQ207C_LL_MinorReward_Credits as Form, 1, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().AddItem(MQ207C_LL_MedPacks as Form, 1, False)
  MQ207C.SetStage(572)
EndFunction

Function Fragment_Stage_0051_Item_00()
  Game.GetPlayer().RemoveItem(MQ207C_Nishina01_DrBarakovaSlate_II as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0052_Item_00()
  Actor player = Game.GetPlayer()
  player.AddItem(MQ207C_LL_MedSupplies as Form, 1, False)
  player.AddPerk(MQ207C_BarakovaPriceModPerk, False)
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ207C_110_EntranceIntercom.Start()
EndFunction

Function Fragment_Stage_0120_Item_00()
  Quest __temp = Self as Quest
  mq207csupportquestscript kmyQuest = __temp as mq207csupportquestscript
  kmyQuest.UnregisterForExteriorDoorEvents()
  MQ207C.SetStage(120)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Nishina02_I_ScientistEnableMarker.TryToEnable()
  Alias_Nishina02_I_ScientistDisableMarker.TryToDisable()
EndFunction
