ScriptName Fragments:Quests:QF_MQ101SpaceEncounter01_000143B4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Alias_AutoPilot Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  MQ101.setstage(408)
EndFunction

Function Fragment_Stage_0010_Item_00()
  MQ101.setstage(490)
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ101.setstage(495)
EndFunction
