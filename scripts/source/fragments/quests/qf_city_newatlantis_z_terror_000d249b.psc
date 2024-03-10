ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Terror_000D249B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CreditsRewardRadiantQuestSmall Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Predator Auto Const mandatory
ReferenceAlias Property Alias_Kieran Auto Const mandatory
ReferenceAlias Property Alias_Employee Auto Const mandatory
GlobalVariable Property CreditsRewardRadiantQuestLarge Auto Const mandatory
ReferenceAlias Property Alias_CoffeeBeans Auto Const mandatory
ReferenceAlias Property Alias_Markieff Auto Const mandatory
ReferenceAlias Property Alias_DawnsRoost Auto Const mandatory
ReferenceAlias Property Alias_SitMarker Auto Const mandatory
ActorBase Property UC_NA_MarkieffSutherland Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_02_Medium Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_03_Large Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_Markieff.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference MarkieffChair = Alias_SitMarker.GetRef()
  MarkieffChair.SetActorOwner(UC_NA_MarkieffSutherland, False)
  Alias_Markieff.GetRef().MoveTo(MarkieffChair, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(35, True, False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False)
  Alias_Predator.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True)
  Self.SetObjectiveDisplayed(40, True, False)
  Alias_Employee.GetRef().EnableNoWait(False)
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(35, True)
  Self.SetObjectiveDisplayed(45, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True)
  Self.SetObjectiveDisplayed(50, True, False)
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives()
  Self.Stop()
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveSkipped(35)
  Self.SetObjectiveSkipped(45)
  Self.CompleteAllObjectives()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  PlayerRef.RemoveItem(Alias_CoffeeBeans.GetRef() as Form, 1, False, None)
  If Self.GetStageDone(25)
    PlayerRef.AddItem(Credits as Form, 4000, False)
  Else
    PlayerRef.AddItem(Credits as Form, 2000, False)
  EndIf
  Alias_Employee.GetRef().DisableNoWait(False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  PlayerRef.RemoveItem(Alias_CoffeeBeans.GetRef() as Form, 1, False, None)
  If Self.GetStageDone(35)
    PlayerRef.AddItem(Credits as Form, 6000, False)
  Else
    PlayerRef.AddItem(Credits as Form, 3000, False)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Employee.GetRef().DisableNoWait(False)
  Alias_SitMarker.GetRef().SetActorOwner(None, False)
  Self.Stop()
EndFunction
