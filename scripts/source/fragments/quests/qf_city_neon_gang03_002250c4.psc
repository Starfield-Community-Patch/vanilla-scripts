ScriptName Fragments:Quests:QF_City_Neon_Gang03_002250C4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Gang03_OutsideFinalMarker_Briggs Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Aura Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Vogal Auto Const mandatory
ReferenceAlias Property Alias_Aura Auto Const mandatory
ReferenceAlias Property Alias_Briggs Auto Const mandatory
ReferenceAlias Property Alias_Vogal Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Warehouse Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Owen Auto Const mandatory
ReferenceAlias Property Alias_OwenDexler Auto Const mandatory
ReferenceAlias Property Alias_Hatchet Auto Const mandatory
ObjectReference Property Gang03_OutsideFinalMarker_Hatchet Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Hangout01 Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Hangout02 Auto Const mandatory
RefCollectionAlias Property Alias_Disciples_Hangout03 Auto Const mandatory
ReferenceAlias Property Alias_HoltHenley Auto Const mandatory
ReferenceAlias Property Alias_Disciple01Leader Auto Const mandatory
Scene Property Gang03_0400_GangEncounter Auto Const mandatory
Scene Property Gang03_0500_HoltEncounter Auto Const mandatory
ObjectReference Property Gang03_FinaleEntranceMarker Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
RefCollectionAlias Property Alias_StrikerLeaders Auto Const mandatory
Scene Property Gang03_0900_OwenArrives Auto Const mandatory
RefCollectionAlias Property Alias_BackupSecurity Auto Const mandatory
Outfit Property Outfit_Scum_NoHelmet Auto Const mandatory
Outfit Property Outfit_Clothes_Neon_Security_NoHelmet Auto Const mandatory
ObjectReference Property Gang03_PostQuestStrikerMarker Auto Const mandatory
ActorValue Property Gang03_Foreknowledge_HelpedStrikersAV Auto Const mandatory
Keyword Property AnimFlavorArmsCrossedCasual Auto Const mandatory
Keyword Property AnimFlavorCrouching Auto Const mandatory
Faction Property DisciplesGangFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Quest Property FFNeonZ10 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_StrikerLeaders.AddRef(Alias_Aura.GetRef())
  Alias_StrikerLeaders.AddRef(Alias_Briggs.GetRef())
  Alias_StrikerLeaders.AddRef(Alias_Hatchet.GetRef())
  Alias_StrikerLeaders.AddRef(Alias_Vogal.GetRef())
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Gang03_OutsideFinalMarker_Aura, 0.0, 0.0, 0.0, True, False)
  Self.SetStage(700)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(300, True, False)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(200, True)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(700, True, False)
  Alias_Disciples_Hangout01.EnableAll(False)
  Alias_Disciples_Hangout02.EnableAll(False)
  Alias_HoltHenley.GetRef().Enable(False)
  Alias_Disciple01Leader.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest
  gang03_script kmyQuest = __temp as gang03_script
  kmyQuest.HangOutsCleared()
  If Self.GetStageDone(500) && Self.GetStageDone(600)
    Self.SetStage(700)
  EndIf
EndFunction

Function Fragment_Stage_0405_Item_00()
  Gang03_0400_GangEncounter.Start()
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetStage(400)
  Alias_Disciple01Leader.GetActorRef().EvaluatePackage(False)
  Alias_Disciples_Hangout01.EvaluateAll()
EndFunction

Function Fragment_Stage_0430_Item_00()
  Alias_Disciple01Leader.GetActorRef().RemoveFromAllFactions()
  Alias_Disciple01Leader.GetActorRef().AddToFaction(PlayerEnemyFaction)
  Alias_Disciple01Leader.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
  Alias_Disciples_Hangout01.RemoveFromFaction(DisciplesGangFaction)
  Alias_Disciples_Hangout01.AddToFaction(PlayerEnemyFaction)
  Alias_Disciples_Hangout01.StartCombatAll(Game.GetPlayer() as ObjectReference)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  gang03_script kmyQuest = __temp as gang03_script
  kmyQuest.HangOutsCleared()
  Self.SetObjectiveDisplayed(520, False, False)
  Actor aPlayer = Game.GetPlayer()
  Actor aTarg = Alias_Briggs.GetActorRef()
  aTarg.SetEssential(True)
  aTarg = Alias_Hatchet.GetActorRef()
  aTarg.SetEssential(True)
  aTarg = Alias_Aura.GetActorRef()
  aTarg.SetEssential(True)
  aTarg = Alias_Vogal.GetActorRef()
  aTarg.SetEssential(True)
  If Self.GetStageDone(400) && Self.GetStageDone(600)
    Self.SetStage(700)
  EndIf
EndFunction

Function Fragment_Stage_0505_Item_00()
  Gang03_0500_HoltEncounter.Start()
EndFunction

Function Fragment_Stage_0510_Item_00()
  Alias_Disciples_Hangout02.AddToFaction(PlayerEnemyFaction)
  Alias_Disciples_Hangout02.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Actor aTarg = Alias_HoltHenley.GetActorRef()
  aTarg.AddToFaction(PlayerEnemyFaction)
  aTarg.SetValue(Aggression, 2.0)
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False)
  aTarg.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetObjectiveDisplayed(520, True, False)
  Actor aPlayer = Game.GetPlayer()
  Actor aTarg = Alias_Briggs.GetActorRef()
  aTarg.SetEssential(False)
  aTarg = Alias_Hatchet.GetActorRef()
  aTarg.SetEssential(False)
  aTarg = Alias_Aura.GetActorRef()
  aTarg.SetEssential(False)
  aTarg = Alias_Vogal.GetActorRef()
  aTarg.SetEssential(False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  gang03_script kmyQuest = __temp as gang03_script
  kmyQuest.HangOutsCleared()
  If Self.GetStageDone(400) && Self.GetStageDone(500)
    Self.SetStage(700)
  EndIf
EndFunction

Function Fragment_Stage_0650_Item_00()
  Alias_Disciples_Hangout03.RemoveFromFaction(DisciplesGangFaction)
  Alias_Disciples_Hangout03.AddToFaction(PlayerEnemyFaction)
  Alias_Disciples_Hangout03.EnableAll(False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
  If !Self.GetStageDone(200)
    Self.SetObjectiveDisplayed(200, False, False)
  EndIf
  Alias_Disciples_Warehouse.StartCombatAll(Game.GetPlayer() as ObjectReference)
  Alias_Aura.GetRef().MoveTo(Gang03_OutsideFinalMarker_Aura, 0.0, 0.0, 0.0, True, False)
  Alias_Briggs.GetRef().MoveTo(Gang03_OutsideFinalMarker_Briggs, 0.0, 0.0, 0.0, True, False)
  Alias_Hatchet.GetRef().MoveTo(Gang03_OutsideFinalMarker_Hatchet, 0.0, 0.0, 0.0, True, False)
  Alias_Vogal.GetRef().MoveTo(Gang03_OutsideFinalMarker_Vogal, 0.0, 0.0, 0.0, True, False)
  If Self.GetStageDone(200)
    Alias_Aura.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False)
    Alias_Briggs.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False)
    Alias_Hatchet.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False)
    Alias_Vogal.GetActorRef().SetOutfit(Outfit_Scum_NoHelmet, False)
  EndIf
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(900, True, False)
  Self.SetObjectiveDisplayed(520, False, False)
  Alias_Disciples_Warehouse.EnableAll(False)
  Alias_Aura.GetActorRef().AddToFaction(PlayerFaction)
  Alias_Briggs.GetActorRef().AddToFaction(PlayerFaction)
  Alias_Hatchet.GetActorRef().AddToFaction(PlayerFaction)
  Alias_Vogal.GetActorRef().AddToFaction(PlayerFaction)
EndFunction

Function Fragment_Stage_0810_Item_00()
  Alias_Aura.GetActorRef().EvaluatePackage(False)
  Alias_Briggs.GetActorRef().EvaluatePackage(False)
  Alias_Hatchet.GetActorRef().EvaluatePackage(False)
  Alias_Vogal.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0820_Item_00()
  If Self.GetStageDone(810)
    ObjectReference oTarg = Gang03_FinaleEntranceMarker
    Alias_Aura.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
    Alias_Briggs.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
    Alias_Hatchet.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
    Alias_Vogal.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
    Self.SetStage(825)
  EndIf
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveDisplayed(200, False, False)
  Self.SetObjectiveDisplayed(700, False, False)
  Self.SetObjectiveCompleted(520, True)
  Self.SetObjectiveDisplayed(1200, True, False)
  Actor aPlayer = Game.GetPlayer()
  Actor aTarg = Alias_Briggs.GetActorRef()
  aTarg.SetEssential(False)
  aTarg.StartCombat(aPlayer as ObjectReference, False)
  aTarg = Alias_Hatchet.GetActorRef()
  aTarg.SetEssential(False)
  aTarg.StartCombat(aPlayer as ObjectReference, False)
  aTarg = Alias_Aura.GetActorRef()
  aTarg.SetEssential(False)
  aTarg.StartCombat(aPlayer as ObjectReference, False)
  aTarg = Alias_Vogal.GetActorRef()
  aTarg.SetEssential(False)
  aTarg.StartCombat(aPlayer as ObjectReference, False)
EndFunction

Function Fragment_Stage_0875_Item_00()
  Self.SetObjectiveDisplayed(800, False, False)
  Self.SetStage(850)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest
  gang03_script kmyQuest = __temp as gang03_script
  Self.SetObjectiveCompleted(900, True)
  Self.SetObjectiveDisplayed(1000, True, False)
  CrimeFactionNeon.SetCrimeGold(0)
  CrimeFactionNeon.SetCrimeGoldViolent(0)
  Alias_OwenDexler.GetRef().MoveTo(Gang03_OutsideFinalMarker_Owen, 0.0, 0.0, 0.0, True, False)
  Alias_OwenDexler.GetRef().Enable(False)
  Gang03_0900_OwenArrives.Start()
  Alias_Aura.GetRef().AddKeyword(AnimFlavorCrouching)
  ObjectReference oTarg = Gang03_FinaleEntranceMarker
  If !Self.GetStageDone(810)
    kmyQuest.MoveStriker(Alias_Aura.GetActorRef())
    kmyQuest.MoveStriker(Alias_Briggs.GetActorRef())
    kmyQuest.MoveStriker(Alias_Hatchet.GetActorRef())
    kmyQuest.MoveStriker(Alias_Vogal.GetActorRef())
    Alias_Aura.GetActorRef().EvaluatePackage(False)
    Alias_Briggs.GetActorRef().EvaluatePackage(False)
    Alias_Hatchet.GetActorRef().EvaluatePackage(False)
    Alias_Vogal.GetActorRef().EvaluatePackage(False)
  Else
    Alias_Aura.GetActorRef().EvaluatePackage(False)
    Alias_Briggs.GetActorRef().EvaluatePackage(False)
    Alias_Hatchet.GetActorRef().EvaluatePackage(False)
    Alias_Vogal.GetActorRef().EvaluatePackage(False)
  EndIf
  Alias_OwenDexler.GetRef().MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
  Alias_BackupSecurity.EnableAll(False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  Self.SetObjectiveDisplayed(1100, True, False)
  Alias_Briggs.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.CompleteAllObjectives()
  Game.GetPlayer().SetValue(Gang03_Foreknowledge_HelpedStrikersAV, 1.0)
  FFNeonZ10.Start()
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives()
  FFNeonZ10.Start()
  Self.SetStage(9000)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_BackupSecurity.DisableAll(False)
  If Self.GetStageDone(1100)
    Alias_Aura.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False)
    Alias_Briggs.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False)
    Alias_Hatchet.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False)
    Alias_Vogal.GetActorRef().SetOutfit(Outfit_Clothes_Neon_Security_NoHelmet, False)
    Alias_Aura.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False)
    Alias_Briggs.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False)
    Alias_Hatchet.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False)
    Alias_Vogal.GetActorRef().MoveTo(Gang03_PostQuestStrikerMarker, 0.0, 0.0, 0.0, True, False)
  EndIf
  Self.Stop()
EndFunction
