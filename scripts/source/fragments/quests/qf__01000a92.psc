ScriptName Fragments:Quests:QF__01000A92 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Corpse_Creature_00 Auto Const mandatory
ReferenceAlias Property Alias_Corpse_Creature_01 Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Predator_Apex Auto Const mandatory
RefCollectionAlias Property Alias_Predators_GroupFormation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Alias_Corpse_Creature_00 as Bool && Utility.RandomInt(1, 2) == 1
    Alias_Corpse_Creature_00.GetRef().Enable(False)
  EndIf
  If Alias_Corpse_Creature_01 as Bool && Utility.RandomInt(1, 4) == 1
    Alias_Corpse_Creature_01.GetRef().Enable(False)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int chance = Utility.RandomInt(1, 10)
  If chance <= 1
    Self.SetStage(210)
  ElseIf chance <= 2
    Self.SetStage(220)
  ElseIf chance <= 4
    Self.SetStage(230)
  ElseIf chance <= 7
    Self.SetStage(240)
  Else
    Self.SetStage(250)
  EndIf
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Terrormorph_Spawn.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_Predator_Apex.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Alias_Predators_GroupFormation.EnableAll(False)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LaunchAllShips(True)
EndFunction
