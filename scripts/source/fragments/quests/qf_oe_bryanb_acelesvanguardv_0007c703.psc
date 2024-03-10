ScriptName Fragments:Quests:QF_OE_BryanB_AcelesVanguardV_0007C703 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Predator_Spawn Auto Const mandatory
RefCollectionAlias Property Alias_PredatorGroup_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
RefCollectionAlias Property Alias_HomesteaderSurvivors Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
ReferenceAlias Property Alias_Marker_Center Auto Const mandatory
ReferenceAlias Property Alias_Homesteader_Leader Auto Const mandatory
ReferenceAlias Property Alias_Object_Key Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Alias_Object_Key.GetRef()
    Self.SetStage(125)
  Else
    Alias_Container_Reward.GetRef().SetLockLevel(50)
  EndIf
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(125)
    Game.GetPlayer().AddItem(Alias_Object_Key.GetRef() as Form, 1, False)
  Else
    Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False)
  EndIf
  Alias_Container_Reward.GetRef().SetFactionOwner(None, False)
EndFunction

Function Fragment_Stage_5000_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
