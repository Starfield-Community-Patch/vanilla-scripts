ScriptName Fragments:Quests:QF_OE_Austinf_EggThief_00006E52 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Corpse_Creature_00 Auto Const mandatory
ReferenceAlias Property Alias_Corpse_Creature_01 Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Predator_Apex Auto Const mandatory
RefCollectionAlias Property Alias_Predators_GroupFormation Auto Const mandatory
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  Int chance = Utility.RandomInt(1, 5)
  If chance == 1
    Self.SetStage(210)
  ElseIf chance == 2
    Self.SetStage(220)
  ElseIf chance == 3
    Self.SetStage(230)
  ElseIf chance == 4
    Self.SetStage(240)
  Else
    Self.SetStage(250)
  EndIf
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Terrormorph_Spawn.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Alias_Predator_Apex.GetRef().RemoveKeyword(OE_PackageCheck_Keyword)
  (Alias_Predator_Apex.GetRef() as Actor).EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0230_Item_00()
  ObjectReference Creature = None
  Int index = 0
  While index < Alias_Predators_GroupFormation.GetCount()
    Creature = Alias_Predators_GroupFormation.GetAt(index)
    If Creature
      Creature.RemoveKeyword(OE_PackageCheck_Keyword)
      (Creature as Actor).EvaluatePackage(False)
    EndIf
    index += 1
  EndWhile
EndFunction

Function Fragment_Stage_0240_Item_00()
  Quest __temp = Self as Quest
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
  kmyQuest.LaunchAllShips(True)
EndFunction
