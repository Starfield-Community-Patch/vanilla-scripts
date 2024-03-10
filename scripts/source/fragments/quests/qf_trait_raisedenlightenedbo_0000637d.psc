ScriptName Fragments:Quests:QF_Trait_RaisedEnlightenedBo_0000637D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference[] Property EnlightenedLootboxes Auto Const
Perk Property TRAIT_RaisedEnlightened Auto Const mandatory
ObjectReference Property RaisedEnlightenedLootboxEnabler Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0500_Item_00()
  If Game.GetPlayer().HasPerk(TRAIT_RaisedEnlightened)
    RaisedEnlightenedLootboxEnabler.Enable(False)
  EndIf
EndFunction

Function Fragment_Stage_0600_Item_00()
  RaisedEnlightenedLootboxEnabler.Disable(False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.STOP()
EndFunction
