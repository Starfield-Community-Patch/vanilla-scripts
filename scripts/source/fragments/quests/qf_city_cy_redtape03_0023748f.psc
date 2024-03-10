ScriptName Fragments:Quests:QF_City_CY_RedTape03_0023748F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Trevor Auto Const mandatory
ReferenceAlias Property Alias_Clint Auto Const mandatory
ReferenceAlias Property Alias_Hank Auto Const mandatory
ReferenceAlias Property Alias_BarMarker Auto Const mandatory
Potion Property DrinkBottle_BeerAle_Md Auto Const mandatory
Faction Property CityCYRedTape03HankHostileFaction Auto Const mandatory
Scene Property City_CY_RedTape03_0880_Booth_Hank_Jail Auto Const mandatory
Scene Property City_CY_RedTape03_0800_Hank_Threaten Auto Const mandatory
ReferenceAlias Property Alias_Booth Auto Const mandatory
GlobalVariable Property City_CY_RedTape03_HankMad Auto Const mandatory
Quest Property City_CY_Psych01 Auto Const mandatory
ReferenceAlias Property Alias_HankJailMarker Auto Const mandatory
Quest Property DialogueCydonia Auto Const mandatory
Scene Property City_CY_RedTape03_0855_Companion_HankDead Auto Const mandatory
ActorValue Property City_CY_RedTape03_Foreknowledge_HankAV Auto Const mandatory
ActorValue Property City_CY_RedTape03_Foreknowledge_HankAtShipAV Auto Const mandatory
ActorValue Property City_CY_RedTape03_Foreknowledge_HankInBarAV Auto Const mandatory
Topic Property City_CY_RedTape03_Hank_Walking01Topic Auto Const mandatory
Topic Property City_CY_RedTape03_Hank_Walking02Topic Auto Const mandatory
Topic Property City_CY_RedTape03_Hank_Walking03Topic Auto Const mandatory
ReferenceAlias Property Alias_HankShip Auto Const mandatory
Perk Property BackgroundLongHauler Auto Const mandatory
Perk Property BackgroundBouncer Auto Const mandatory
Perk Property BackgroundGangster Auto Const mandatory
Perk Property TRAIT_Empath Auto Const mandatory
Perk Property TRAIT_Wanted Auto Const mandatory
Weapon Property Cutter Auto Const mandatory
LeveledItem Property LL_Weapon_UrbanEagle Auto Const mandatory
LeveledItem Property LLW_Ammo_UrbanEagle Auto Const mandatory
Weapon Property UrbanEagle Auto Const mandatory
ReferenceAlias Property Alias_HankWeapon Auto Const mandatory
ReferenceAlias Property Alias_JailDoor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.MoveTo(Alias_Trevor.GetRef(), 0.0, 0.0, 0.0, True, False)
  myPlayer.AddPerk(BackgroundLongHauler, False)
  myPlayer.AddPerk(BackgroundBouncer, False)
  myPlayer.AddPerk(BackgroundGangster, False)
  myPlayer.AddPerk(TRAIT_Empath, False)
  myPlayer.AddPerk(TRAIT_Wanted, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Clint.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().MoveTo(Alias_Trevor.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(Alias_Hank.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.MoveTo(Alias_Trevor.GetRef(), 0.0, 0.0, 0.0, True, False)
  Actor myHank = Alias_Hank.GetActorRef()
  If myHank.IsDead() == False
    myHank.MoveTo(myPlayer as ObjectReference, 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_0006_Item_00()
  Actor myPlayer = Game.GetPlayer()
  myPlayer.MoveTo(Alias_Booth.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_Hank.GetRef().MoveTo(myPlayer as ObjectReference, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Hank.GetRef().Disable(False)
  Self.SetObjectiveDisplayed(100, True, False)
  Self.SetActive(True)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(300, True, False)
  Alias_HankShip.GetShipRef().Enable(False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  If !Self.IsObjectiveCompleted(100)
    Self.SetObjectiveCompleted(100, True)
  EndIf
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0400_Item_01()
  If !Self.IsObjectiveCompleted(100)
    Self.SetObjectiveCompleted(100, True)
  EndIf
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
EndFunction

Function Fragment_Stage_0500_Item_00()
  ObjectReference myHankRef = Alias_Hank.GetRef()
  myHankRef.MoveTo(Alias_BarMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  myHankRef.Enable(False)
  ObjectReference myHankActor = Alias_Hank.GetRef()
  myHankActor.RemoveItem(Cutter as Form, 1, False, None)
  myHankActor.AddItem(LLW_Ammo_UrbanEagle as Form, 1, False)
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
EndFunction

Function Fragment_Stage_0610_Item_00()
  Game.GetPlayer().AddItem(DrinkBottle_BeerAle_Md as Form, 1, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  citycyredtape03hankdistancescript kmyQuest = __temp as citycyredtape03hankdistancescript
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
  Actor myHank = Alias_Hank.GetActorRef()
  myHank.EvaluatePackage(False)
  myHank.EquipItem(Alias_HankWeapon.GetRef() as Form, False, False)
  kmyQuest.StartDistanceCheck()
  If Game.GetPlayer().GetValue(City_CY_RedTape03_Foreknowledge_HankInBarAV) == 1.0
    myHank.SetEssential(False)
  EndIf
EndFunction

Function Fragment_Stage_0705_Item_00()
  Alias_Hank.GetActorRef().SetEssential(False)
EndFunction

Function Fragment_Stage_0720_Item_00()
  Quest __temp = Self as Quest
  citycyredtape03hankdistancescript kmyQuest = __temp as citycyredtape03hankdistancescript
  Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking01Topic, None, False, None)
  kmyQuest.StartDistanceCheck()
EndFunction

Function Fragment_Stage_0721_Item_00()
  Quest __temp = Self as Quest
  citycyredtape03hankdistancescript kmyQuest = __temp as citycyredtape03hankdistancescript
  Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking02Topic, None, False, None)
  kmyQuest.StartDistanceCheck()
EndFunction

Function Fragment_Stage_0722_Item_00()
  Alias_Hank.GetRef().Say(City_CY_RedTape03_Hank_Walking03Topic, None, False, None)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Alias_Hank.GetActorRef().SetEssential(False)
  City_CY_RedTape03_0800_Hank_Threaten.Start()
EndFunction

Function Fragment_Stage_0805_Item_00()
  Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankInBarAV, 1.0)
  Utility.Wait(2.5)
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
EndFunction

Function Fragment_Stage_0806_Item_00()
  Actor myHank = Alias_Hank.GetActorRef()
  (myHank as ObjectReference).RemoveItem(Alias_HankWeapon.GetRef() as Form, 1, False, None)
  Game.GetPlayer().AddItem(LL_Weapon_UrbanEagle as Form, 1, False)
  myHank.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0850_Item_00()
  Actor myHank = Alias_Hank.GetActorRef()
  myHank.RemoveFromAllFactions()
  myHank.AddToFaction(CityCYRedTape03HankHostileFaction)
  myHank.StartCombat(Game.GetPlayer() as ObjectReference, False)
  myHank.EvaluatePackage(False)
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(850, True, False)
  If City_CY_Psych01.IsRunning()
    If !City_CY_Psych01.GetStageDone(120)
      City_CY_Psych01.SetStage(121)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0855_Item_00()
  Self.SetStage(900)
  Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankAtShipAV, 1.0)
  City_CY_RedTape03_0855_Companion_HankDead.Start()
EndFunction

Function Fragment_Stage_0860_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetObjectiveDisplayed(860, True, False)
  Alias_Hank.GetActorRef().EvaluatePackage(False)
  If City_CY_Psych01.IsRunning()
    If !City_CY_Psych01.GetStageDone(120)
      City_CY_Psych01.SetStage(121)
    EndIf
  EndIf
EndFunction

Function Fragment_Stage_0861_Item_00()
  City_CY_RedTape03_HankMad.SetValue(1.0)
EndFunction

Function Fragment_Stage_0880_Item_00()
  Self.SetStage(900)
  Alias_JailDoor.GetRef().SetOpen(True)
  City_CY_RedTape03_0880_Booth_Hank_Jail.Start()
  Alias_Hank.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0881_Item_00()
  Quest __temp = Self as Quest
  citycyredtape03questscript kmyQuest = __temp as citycyredtape03questscript
  kmyQuest.CloseJailCell()
EndFunction

Function Fragment_Stage_0886_Item_00()
  Quest __temp = Self as Quest
  citycyredtape03questscript kmyQuest = __temp as citycyredtape03questscript
  kmyQuest.CloseJailCell()
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveCompleted(800, True)
  If Self.IsObjectiveDisplayed(850)
    Self.SetObjectiveCompleted(850, True)
  EndIf
  If Self.IsObjectiveDisplayed(860)
    If !Self.GetStageDone(855)
      Self.SetObjectiveCompleted(860, True)
    Else
      Self.SetObjectiveFailed(860, True)
    EndIf
  EndIf
  If !Self.GetStageDone(855)
    Alias_Hank.GetActorRef().EvaluatePackage(False)
  EndIf
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_0901_Item_00()
  If Self.GetStageDone(880)
    Alias_Hank.GetRef().MoveTo(Alias_HankJailMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  EndIf
EndFunction

Function Fragment_Stage_10000_Item_00()
  DialogueCydonia.SetStage(2600)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(900, True)
  Game.GetPlayer().SetValue(City_CY_RedTape03_Foreknowledge_HankAV, 1.0)
  DialogueCydonia.SetStage(1120)
  ObjectReference myHank = Alias_Hank.GetRef()
  If myHank.IsDisabled() == True
    myHank.Enable(False)
  EndIf
  DialogueCydonia.SetStage(1120)
  ObjectReference myHankActor = Alias_Hank.GetRef()
  myHankActor.RemoveItem(Alias_HankWeapon.GetRef() as Form, 1, False, None)
  If !Self.GetStageDone(880)
    myHankActor.AddItem(Cutter as Form, 1, False)
  EndIf
  Self.Stop()
EndFunction
