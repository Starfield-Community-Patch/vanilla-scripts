ScriptName Fragments:Quests:QF_OE_AustinF_CreatureCage_Script Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CageMarker Auto Const mandatory
ReferenceAlias Property Alias_NestMarker Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
ReferenceAlias Property Alias_Cage Auto Const mandatory
ReferenceAlias Property Alias_Creature Auto Const mandatory
ReferenceAlias Property Alias_Creature_Hard Auto Const mandatory
ReferenceAlias Property Alias_Creature_Medium Auto Const mandatory
ReferenceAlias Property Alias_Creature_Easy Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
Perk Property BackgroundBigGameHunter Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
Perk Property BackgroundExplorer Auto Const mandatory
GlobalVariable Property LockLevel_Novice Auto Const mandatory
GlobalVariable Property LockLevel_Expert Auto Const mandatory
GlobalVariable Property LockLevel_Advanced Auto Const mandatory
GlobalVariable Property LockLevel_Master Auto Const mandatory
LeveledItem Property LL_OELoot Auto Const mandatory
LeveledItem Property LL_OELoot_Rare Auto Const mandatory
LeveledItem Property LL_OELoot_Uncommon Auto Const mandatory
ReferenceAlias Property Alias_NPCCorpse Auto Const mandatory
ReferenceAlias Property Alias_CageDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(5)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Creature.GetActorRef().Disable(False)
  Alias_Creature_Hard.GetActorRef().Disable(False)
  Alias_Creature_Medium.GetActorRef().Disable(False)
  Alias_Creature_Easy.GetActorRef().Disable(False)
  Alias_Cage.GetRef().Enable(False)
  Alias_Nest.GetRef().Enable(False)
  Self.SetStage(10)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor Creature = Alias_Creature.GetActorRef()
  Creature.MoveTo(Alias_CageMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Creature.SetScale(0.699999988)
  Creature.Enable(False)
  Creature.MoveTo(Alias_CageMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(20)
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference Cage = Alias_CageDoor.GetRef()
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  Int Range = PlayerLevel / 2
  Int NoviceLockLevel = LockLevel_Novice.GetValue() as Int
  Int AdvancedLockLevel = LockLevel_Advanced.GetValue() as Int
  Int ExpertLockLevel = LockLevel_Expert.GetValue() as Int
  Int MasterLockLevel = LockLevel_Master.GetValue() as Int
  PlayerLevel = Math.Clamp(PlayerLevel as Float, 0.0, 100.0) as Int
  Range = Utility.RandomInt(Range, PlayerLevel)
  Cage.SetOpen(False)
  If Range < NoviceLockLevel
    Cage.Lock(False, False, True)
    Cage.UnLock(True)
  Else
    Cage.Lock(True, False, True)
    If Range < AdvancedLockLevel
      Cage.SetLockLevel(NoviceLockLevel)
    ElseIf Range < ExpertLockLevel
      Cage.SetLockLevel(AdvancedLockLevel)
    ElseIf Range < MasterLockLevel
      Cage.SetLockLevel(ExpertLockLevel)
    Else
      Cage.SetLockLevel(MasterLockLevel)
    EndIf
  EndIf
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference Nest = Alias_Nest.GetRef()
  Actor Player = Game.GetPlayer()
  Nest.MoveTo(Alias_NestMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Nest.Enable(False)
  Nest.UnLock(False)
  Nest.SetOpen(True)
  If Player.HasPerk(BackgroundExplorer) || Player.HasPerk(BackgroundXenobiologist) || Player.HasPerk(BackgroundBigGameHunter)
    Self.SetStage(35)
  ElseIf Utility.RandomInt(Player.GetLevel(), 100) > Utility.RandomInt(0, 100)
    Self.SetStage(35)
  EndIf
  Self.SetStage(40)
EndFunction

Function Fragment_Stage_0035_Item_00()
  Actor Player = Game.GetPlayer()
  Alias_Nest.GetRef().AddItem(LL_OELoot as Form, 1, False)
  If Player.HasPerk(BackgroundExplorer) || Player.HasPerk(BackgroundXenobiologist) || Player.HasPerk(BackgroundBigGameHunter)
    Alias_Nest.GetRef().AddItem(LL_OELoot as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  Int BonusChance = Utility.RandomInt(1, 3)
  If BonusChance > 1
    Self.SetStage(45)
  EndIf
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Actor BonusCreature = None
  Int Random = Utility.RandomInt(0, Game.GetPlayer().GetLevel())
  If Random > 75
    Alias_Creature_Hard.TryToEnable()
    Alias_Creature_Easy.TryToEnable()
  ElseIf Random > 25
    Alias_Creature_Easy.TryToEnable()
  EndIf
EndFunction

Function Fragment_Stage_0050_Item_00()
  ObjectReference Corpse = Alias_NPCCorpse.GetRef()
  ObjectReference Nest = Alias_NestMarker.GetRef()
  ObjectReference Cage = Alias_CageMarker.GetRef()
  Int Random = Utility.RandomInt(1, 4)
  If Random < 4
    If Nest != None || Cage != None
      Self.SetStage(55)
    EndIf
  EndIf
  Self.SetStage(90)
EndFunction

Function Fragment_Stage_0055_Item_00()
  ObjectReference Marker = Alias_CageMarker.GetRef()
  ObjectReference Corpse = Alias_NPCCorpse.GetRef()
  Int Random = Utility.RandomInt(0, 3)
  If Corpse != None
    If Random < 2
      Marker = Alias_NestMarker.GetRef()
      Random = Utility.RandomInt(0, 3)
    EndIf
    If Random < 3
      Corpse.MoveTo(Marker, 0.0, 0.0, 0.0, True, False)
    EndIf
    Alias_NPCCorpse.GetRef().Enable(False)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel()
  If Utility.RandomInt(0, PlayerLevel) > 50
    Alias_Creature_Medium.TryToEnable()
  EndIf
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor Creature = Alias_Creature.GetActorRef()
  Creature.AddToFaction(PlayerEnemyFaction)
  Creature.StartCombat(Alias_Player.GetRef(), False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(200)
    Alias_Nest.GetRef().AddItem(LL_OELoot_Rare as Form, 1, False)
  Else
    Alias_Nest.GetRef().AddItem(LL_OELoot_Uncommon as Form, 1, False)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  If Self.GetStageDone(850)
    Self.SetStage(999)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  If Self.GetStageDone(800)
    Self.SetStage(999)
  EndIf
EndFunction
