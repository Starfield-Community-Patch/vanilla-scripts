ScriptName Fragments:Quests:QF_LC043_002BF370 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_SY01_ActorsAll Auto Const mandatory
RefCollectionAlias Property Alias_SY02_ActorsAll Auto Const mandatory
RefCollectionAlias Property Alias_SY03_ActorsAll Auto Const mandatory
RefCollectionAlias Property Alias_SY02_ActorsInitiallyEnabled Auto Const mandatory
RefCollectionAlias Property Alias_SY03_ActorsInitiallyEnabled Auto Const mandatory
RefCollectionAlias Property Alias_SY_Ships_Quest_All Auto Const
RefCollectionAlias Property Alias_SY_Ships_Prequest_All Auto Const mandatory
RefCollectionAlias Property Alias_SY_Ships_Postquest_All Auto Const mandatory
RefCollectionAlias Property Alias_SY_Ships_Guards Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
RefCollectionAlias Property Alias_SY01_NavmeshPlatformDisableSpecial Auto Const mandatory
ReferenceAlias Property Alias_SY01_CargoBayBarracksGuard Auto Const mandatory
RefCollectionAlias Property Alias_SY02_CommandBayLobbySoliders Auto Const mandatory
ReferenceAlias Property Alias_SY02_Natara Auto Const mandatory
RefCollectionAlias Property Alias_SY02_CommandBayCombatResponders Auto Const mandatory
ReferenceAlias Property Alias_SY02_CommandBaySecurityDoor Auto Const mandatory
Scene Property LC043_50_GuardAttack Auto Const mandatory
Faction Property LC043SYQuestShipFaction Auto Const mandatory
Faction Property LC043SYNonquestShipFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property LC043SY01FriendFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory
Quest Property CF05_Alarm Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property CF05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0320_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0460_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0050_Item_00()
  LC043_50_GuardAttack.Start()
  LC043SYNonquestShipFaction.SetEnemy(PlayerFaction, False, False)
  Alias_SY_Ships_Guards.EvaluateAll()
EndFunction

Function Fragment_Stage_0051_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0099_Item_00()
  Quest __temp = Self as Quest
  lc043questscript kmyQuest = __temp as lc043questscript
  Alias_SY_Ships_Prequest_All.DisableAll(False)
  Alias_SY_Ships_Quest_All.EnableAll(False)
  kmyQuest.CleanupPrequestAliases()
  kmyQuest.FillInteriorAliases()
  Alias_SY01_NavmeshPlatformDisableSpecial.DisableAll(False)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.GetPlayer().AddToFaction(LC043SY01FriendFaction)
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_SY01_CargoBayBarracksGuard.TryToEnable()
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest
  lc043questscript kmyQuest = __temp as lc043questscript
  Game.GetPlayer().RemoveFromFaction(LC043SY01FriendFaction)
  Self.SetStage(130)
  kmyQuest.TriggerSecurityAlarm(Alias_SY01_ActorsAll, LC043SY01Faction)
  CF05_Alarm.SetStage(60)
  CF05.SetStage(61)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_SY02_ActorsInitiallyEnabled.EnableAll(False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  If !Self.GetStageDone(250)
    Alias_SY02_CommandBayLobbySoliders.DisableAll(False)
  EndIf
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest
  lc043questscript kmyQuest = __temp as lc043questscript
  kmyQuest.TriggerSecurityAlarm(Alias_SY02_ActorsAll, LC043SY02Faction)
  CF05_Alarm.SetStage(60)
  CF05.SetStage(62)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Quest __temp = Self as Quest
  lc043questscript kmyQuest = __temp as lc043questscript
  If Self.GetStageDone(250)
    Alias_SY02_CommandBaySecurityDoor.GetRef().SetOpen(True)
    Alias_SY02_CommandBayCombatResponders.EnableAll(False)
    Alias_SY02_CommandBayCombatResponders.SetValue(Aggression, 2.0)
    Alias_SY02_CommandBayCombatResponders.EvaluateAll()
    Utility.Wait(2.0)
    Alias_SY02_CommandBayCombatResponders.EvaluateAll()
    Utility.Wait(2.0)
    Alias_SY02_CommandBayCombatResponders.EvaluateAll()
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_SY03_ActorsInitiallyEnabled.EnableAll(False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest
  lc043questscript kmyQuest = __temp as lc043questscript
  kmyQuest.TriggerSecurityAlarm(Alias_SY03_ActorsAll, LC043SY03Faction)
  CF05_Alarm.SetStage(60)
  CF05.SetStage(63)
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest
  lc043questscript kmyQuest = __temp as lc043questscript
  kmyQuest.BlockSpaceTravelForEscape(True)
  LC043SYQuestShipFaction.SetEnemy(PlayerFaction, False, False)
  Alias_SY_Ships_Quest_All.EvaluateAll()
EndFunction

Function Fragment_Stage_0451_Item_00()
  Self.SetStage(450)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest
  lc043questscript kmyQuest = __temp as lc043questscript
  kmyQuest.BlockSpaceTravelForEscape(False)
  Alias_SY_Ships_Prequest_All.DisableAll(False)
  Alias_SY_Ships_Quest_All.DisableAll(False)
  Alias_SY_Ships_Postquest_All.EnableAll(False)
  kmyQuest.CleanupQuestAliases()
EndFunction
