ScriptName Fragments:Quests:QF_OE_BryanB_BrotherInNeed_000DAACF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_BryanB_BrotherInNeed_TalkToSamScene Auto Const
Scene Property OE_BryanB_BrotherInNeed_SamLivesScene Auto Const
Potion Property Aid_MedPack Auto Const mandatory
ReferenceAlias Property Alias_Sibling Auto Const mandatory
Faction Property REPlayerEnemy Auto Const mandatory
ReferenceAlias Property Alias_WoundedSibling Auto Const mandatory
GlobalVariable Property OE_BryanB_FamilyInNeedDone Auto Const mandatory
ActorValue Property SQ_CaptiveStateNoBlockingHellos Auto Const mandatory
Scene Property OE_SiblingInNeed_Scene_CombatStarts Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory
ReferenceAlias Property Alias_SammyInjuredMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Alias_WoundedSibling.TryToSetValue(SQ_CaptiveStateNoBlockingHellos, 1.0)
  Alias_WoundedSibling.GetRef().RemoveItem(Aid_MedPack as Form, 99, False, None)
  Alias_Sibling.GetRef().RemoveItem(Aid_MedPack as Form, 99, False, None)
EndFunction

Function Fragment_Stage_0100_Item_00()
  OE_BryanB_FamilyInNeedDone.SetValue(1.0)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Game.getplayer().RemoveItem(Aid_MedPack as Form, 1, False, None)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_WoundedSibling.TryToKill(None)
  Alias_Sibling.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Actor sibling = Alias_Sibling.GetActorRef()
  sibling.StartCombat(Game.getplayer() as ObjectReference, False)
  sibling.SetValue(Game.GetAggressionAV(), 1.0)
  sibling.AddToFaction(REPlayerEnemy)
EndFunction

Function Fragment_Stage_0250_Item_00()
  OE_SiblingInNeed_Scene_CombatStarts.Start()
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
