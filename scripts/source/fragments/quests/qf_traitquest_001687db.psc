ScriptName Fragments:Quests:QF_TraitQuest_001687DB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property TRAIT_KidStuff Auto Const mandatory
Quest Property TraitKidStuff Auto Const mandatory
Quest Property TraitUnwantedHero Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
Perk Property TRAIT_AlienDNA Auto Const mandatory
Perk Property TRAIT_StarterHome Auto Const mandatory
Quest Property TraitStarterHome Auto Const mandatory
Perk Property TRAIT_Extrovert Auto Const mandatory
Perk Property TRAIT_Introvert Auto Const mandatory
Perk Property TRAIT_RaisedUniversal Auto Const mandatory
Perk Property TRAIT_Taskmaster Auto Const mandatory
Perk Property TRAIT_FreestarCollectiveSettler Auto Const mandatory
Perk Property TRAIT_SerpentsEmbrace Auto Const mandatory
Perk Property TRAIT_UnitedColoniesNative Auto Const mandatory
Perk Property TRAIT_NeonStreetRat Auto Const mandatory
ReferenceAlias Property Alias_MayorCartwright_FC Auto Const mandatory
ReferenceAlias Property Alias_AdministratorRookes_UC Auto Const mandatory
ReferenceAlias Property Alias_MadameSauvage Auto Const mandatory
ReferenceAlias Property Alias_Mirza Auto Const mandatory
ReferenceAlias Property Alias_KeeperAquilus Auto Const mandatory
Perk Property TRAIT_RaisedEnlightened Auto Const mandatory
ReferenceAlias Property Alias_AndySingh Auto Const mandatory
Quest[] Property CREW_EliteQuests Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor aPlayer = Game.GetPlayer()
  Bool bExtrovert = aPlayer.HasPerk(TRAIT_Extrovert)
  Bool bIntrovert = aPlayer.HasPerk(TRAIT_Introvert)
  Bool bUniversal = aPlayer.HasPerk(TRAIT_RaisedUniversal)
  Bool bEnlightened = aPlayer.HasPerk(TRAIT_RaisedEnlightened)
  Bool bTaskmaster = aPlayer.HasPerk(TRAIT_Taskmaster)
  Bool bFC = aPlayer.HasPerk(TRAIT_FreestarCollectiveSettler)
  Bool bSerpent = aPlayer.HasPerk(TRAIT_SerpentsEmbrace)
  Bool bUC = aPlayer.HasPerk(TRAIT_UnitedColoniesNative)
  Bool bNeon = aPlayer.HasPerk(TRAIT_NeonStreetRat)
  If !bExtrovert && !bIntrovert && !bTaskmaster && !bUniversal
    Alias_KeeperAquilus.Clear()
  EndIf
  If !bExtrovert && !bIntrovert && !bTaskmaster && !bEnlightened
    Alias_AndySingh.Clear()
  EndIf
  If !bSerpent
    Alias_Mirza.Clear()
  EndIf
  If !bNeon
    Alias_MadameSauvage.Clear()
  EndIf
  If !bFC
    Alias_MayorCartwright_FC.Clear()
  EndIf
  If !bUC
    Alias_AdministratorRookes_UC.Clear()
  EndIf
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0099_Item_00()
  Quest __temp = Self as Quest
  defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
  Actor aPlayer = Game.GetPlayer()
  Bool bExtrovert = aPlayer.HasPerk(TRAIT_Extrovert)
  Bool bIntrovert = aPlayer.HasPerk(TRAIT_Introvert)
  Bool bUniversal = aPlayer.HasPerk(TRAIT_RaisedUniversal)
  Bool bEnlightened = aPlayer.HasPerk(TRAIT_RaisedEnlightened)
  Bool bTaskmaster = aPlayer.HasPerk(TRAIT_Taskmaster)
  Bool bFC = aPlayer.HasPerk(TRAIT_FreestarCollectiveSettler)
  Bool bSerpent = aPlayer.HasPerk(TRAIT_SerpentsEmbrace)
  Bool bUC = aPlayer.HasPerk(TRAIT_UnitedColoniesNative)
  Bool bNeon = aPlayer.HasPerk(TRAIT_NeonStreetRat)
  If !bExtrovert && !bIntrovert && !bTaskmaster && !bUniversal
    Alias_KeeperAquilus.Clear()
  EndIf
  If !bExtrovert && !bIntrovert && !bTaskmaster && !bEnlightened
    Alias_AndySingh.Clear()
  EndIf
  If !bSerpent
    Alias_Mirza.Clear()
  EndIf
  If !bNeon
    Alias_MadameSauvage.Clear()
  EndIf
  If !bFC
    Alias_MayorCartwright_FC.Clear()
  EndIf
  If !bUC
    Alias_AdministratorRookes_UC.Clear()
  EndIf
  Alias_Player.Clear()
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0099_Item_01()
  If Game.GetPlayer().HasPerk(TRAIT_KidStuff)
    TraitKidStuff.Start()
  EndIf
  If Game.GetPlayer().HasPerk(TRAIT_StarterHome)
    TraitStarterHome.Start()
  Else
    TraitStarterHome.Stop()
  EndIf
EndFunction

Function Fragment_Stage_0099_Item_02()
  TraitUnwantedHero.Start()
EndFunction

Function Fragment_Stage_0099_Item_03()
  TraitWanted.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Game.GetPlayer().HasPerk(TRAIT_KidStuff)
    TraitKidStuff.Start()
  EndIf
  If Game.GetPlayer().HasPerk(TRAIT_StarterHome)
    TraitStarterHome.Start()
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_01()
  TraitUnwantedHero.Start()
EndFunction

Function Fragment_Stage_0100_Item_02()
  TraitWanted.Start()
EndFunction

Function Fragment_Stage_0110_Item_00()
  Game.GetPlayer().RemovePerk(TRAIT_AlienDNA)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Int I = 0
  While I < CREW_EliteQuests.Length
    If CREW_EliteQuests[I].GetStageDone(100)
      (CREW_EliteQuests[I] as crew_elitecrewquestscript).SetCostMultAndUpdateCost(0.5)
    ElseIf CREW_EliteQuests[I].IsRunning()
      (CREW_EliteQuests[I] as crew_elitecrewquestscript).SetCostMultAndUpdateCost(1.0)
    EndIf
    I += 1
  EndWhile
EndFunction
