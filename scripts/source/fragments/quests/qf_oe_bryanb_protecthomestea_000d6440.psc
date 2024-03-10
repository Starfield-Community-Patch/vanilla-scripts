ScriptName Fragments:Quests:QF_OE_BryanB_ProtectHomestea_000D6440 Extends Quest Const hidden

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
ReferenceAlias Property Alias_Marker_TravelA03 Auto Const mandatory
RefCollectionAlias Property Alias_PredatorGroup_Targets Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Int maxCount = Alias_PredatorGroup_Spawn.GetCount()
  Int maxToEnable = Utility.RandomInt(2, maxCount)
  Int I = 0
  While I < maxToEnable
    ObjectReference predatorRef = Alias_PredatorGroup_Spawn.GetAt(I)
    Alias_PredatorGroup_Targets.AddRef(predatorRef)
    predatorRef.Enable(False)
    I += 1
  EndWhile
  Alias_PredatorGroup_Targets.SetValue(Game.GetAggressionAV(), 1.0)
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

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(450)
EndFunction

Function Fragment_Stage_0450_Item_00()
  If !Self.GetStageDone(475)
    Alias_Homesteader_Leader.GetRef().AddKeyword(OE_PackageCheck_Keyword)
  EndIf
  Int index = 0
  While index < Alias_HomesteaderSurvivors.GetCount()
    If Alias_HomesteaderSurvivors.GetAt(index)
      Alias_HomesteaderSurvivors.GetAt(index).AddKeyword(OE_PackageCheck_Keyword)
    EndIf
    index += 1
  EndWhile
  Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0465_Item_00()
  Self.SetStage(460)
EndFunction

Function Fragment_Stage_0475_Item_00()
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Alias_Object_Key
    Game.GetPlayer().AddItem(Alias_Object_Key.GetRef() as Form, 1, False)
  Else
    Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False)
  EndIf
  Alias_Container_Reward.GetRef().SetFactionOwner(None, False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_0510_Item_00()
  Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
EndFunction

Function Fragment_Stage_5000_Item_00()
  Self.Stop()
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
