ScriptName Fragments:Quests:QF_SE_KMK04_002B0B8E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_Ship02 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
RefCollectionAlias Property Alias_Attackers Auto Const mandatory
Scene Property PSE_Raid01a_HailingScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0040_Item_00()
  PSE_Raid01a_HailingScene.start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Attackers.RemoveFromFaction(PlayerFriendFaction)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int I = 0
  Alias_Attackers.EvaluateAll()
  Utility.wait(14.0)
  While I < Alias_Attackers.GetCount()
    (Alias_Attackers.GetAt(I) as spaceshipreference).DisableWithGravJumpNoWait()
    Utility.wait(Utility.randomfloat(0.200000003, 3.900000095))
    I += 1
  EndWhile
EndFunction
