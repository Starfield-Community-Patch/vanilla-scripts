ScriptName Fragments:Quests:QF_OE_AustinF_Photographer_000FC909 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Furniture Property NPCInjuredOnGround Auto Const
ReferenceAlias Property Alias_Marker_SceneA01 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
Keyword Property LinkCustom01 Auto Const
Spell Property AbilityDamageHealthSlow Auto Const
ReferenceAlias Property Alias_FoundMapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_FoundMapMarker.getref().AddToMapScanned(False)
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest
  oescript kmyQuest = __temp as oescript
EndFunction
