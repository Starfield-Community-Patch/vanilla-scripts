ScriptName Fragments:Quests:QF_OE_BryanB_TerrormorphVSSc_0007C704 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Predator_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
RefCollectionAlias Property Alias_HomesteaderSurvivors Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
ReferenceAlias Property Alias_Marker_Center Auto Const mandatory
ReferenceAlias Property Alias_Homesteader_Leader Auto Const mandatory
ReferenceAlias Property Alias_Object_Key Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory
GlobalVariable Property OE_KreetTerrormorphDone Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0125_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0025_Item_00()
  OE_KreetTerrormorphDone.SetValue(1.0)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Alias_Object_Key.GetRef()
    Self.SetStage(125)
  Else
    Alias_Container_Reward.GetRef().SetLockLevel(50)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetStage(25)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300)
  Self.SetStage(25)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(450)
  Self.SetStage(460)
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Self.GetStageDone(400)
    Self.SetStage(460)
  EndIf
EndFunction

Function Fragment_Stage_0460_Item_00()
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
