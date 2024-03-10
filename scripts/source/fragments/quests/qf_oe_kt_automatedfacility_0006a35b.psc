ScriptName Fragments:Quests:QF_OE_KT_AutomatedFacility_0006A35B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_AutomatedFacility_Scene01 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ReferenceAlias Property Alias_NPC00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Scene Property OE_KT_AutomatedFacility_Scene02 Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
RefCollectionAlias Property Alias_Markers_Corpses Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0030_Item_00()
  Alias_NPC_Group00.KillAll(None)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_NPC_Group00.RemovefromFaction(PlayerEnemyFaction)
  Alias_NPC_Group00.AddtoFaction(REPlayerFriend)
  Alias_NPC_Group00.SetValue(Aggression, 0.0)
  Alias_NPC_Group00.StopCombat()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group00.RemovefromFaction(REPlayerFriend)
  Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
  Alias_NPC_Group00.SetValue(Aggression, 1.0)
  Alias_NPC_Group00.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0055_Item_01()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0060_Item_00()
  OE_KT_AutomatedFacility_Scene01.Stop()
  OE_KT_AutomatedFacility_Scene02.Start()
EndFunction

Function Fragment_Stage_0090_Item_00()
  OE_KT_AutomatedFacility_Scene01.Start()
  Alias_NPC_Group00.AddRef(Alias_NPC00.GetRef())
  Alias_NPC_Group00.AddRef(Alias_NPC01.GetRef())
  Alias_NPC_Group00.AddRef(Alias_NPC02.GetRef())
  Alias_NPC_Group00.AddRef(Alias_NPC03.GetRef())
  Alias_NPC_Group00.AddRef(Alias_NPC04.GetRef())
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Terminal.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
