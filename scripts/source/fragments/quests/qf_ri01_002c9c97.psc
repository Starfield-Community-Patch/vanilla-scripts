ScriptName Fragments:Quests:QF_RI01_002C9C97 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NeonStartMarker Auto Const mandatory
Scene Property RI01_250_Imogene_IntroScene Auto Const mandatory
Scene Property RI01_400_Imogene_InterviewScene Auto Const mandatory
ReferenceAlias Property Alias_RyujinCoffeeMarker Auto Const mandatory
MiscObject Property RI01_TerraBrewOrder Auto Const mandatory
Scene Property RI01_510_Tomo_ConfrontationScene Auto Const mandatory
ReferenceAlias Property Alias_TomoHigashi Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
ReferenceAlias Property Alias_NewAtlantisStartMarker Auto Const mandatory
GlobalVariable Property RI01_Track_PlayerWillRunThePlace Auto Const mandatory
GlobalVariable Property RI01_Track_PlayerWhateverItTakes Auto Const mandatory
GlobalVariable Property RI01_Track_PlayerPromisedTomo Auto Const mandatory
Scene Property RI01_700_Companion_TomoPromiseScene Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
ReferenceAlias Property Alias_TerraBrewCoffeeOrder Auto Const mandatory
Scene Property RI01_500_Tomo_ConfrontationScene Auto Const mandatory
Scene Property RI01_200_Lane_GreetingScene Auto Const mandatory
ReferenceAlias Property Alias_LaneGarza Auto Const mandatory
Scene Property RI01_230_Lane_FollowScene Auto Const mandatory
GlobalVariable Property RI01_TomoDead Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewTomoMarker Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer01 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer02 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer03 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewCustomer04 Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewSceneMarker01 Auto Const mandatory
Scene Property RI01_500_Customer03_CommentScene Auto Const mandatory
Scene Property RI01_500_Customer02_CommentScene Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_RyujinCounter Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
GlobalVariable Property PlayerJoined_Ryujin Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
GlobalVariable Property PlayerKnows_Bayu Auto Const mandatory
ReferenceAlias Property Alias_GenevieveMonohan Auto Const mandatory
ReferenceAlias Property Alias_LindenCalderi Auto Const mandatory
ReferenceAlias Property Alias_CamdenCho Auto Const mandatory
ReferenceAlias Property Alias_AlexisPryce Auto Const mandatory
ReferenceAlias Property Alias_RyujinAlexisConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinCamdenConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinGenevieveConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinLindenConferenceChair Auto Const mandatory
ReferenceAlias Property Alias_RyujinImogeneQS Auto Const mandatory
MiscObject Property RI01_ImogeneCoffee Auto Const mandatory
MiscObject Property RI01_LindenCoffee Auto Const mandatory
MiscObject Property RI01_GenevieveCoffee Auto Const mandatory
MiscObject Property RI01_CamdenCoffee Auto Const mandatory
MiscObject Property RI01_AlexisCoffee Auto Const mandatory
ReferenceAlias Property Alias_CoffeeCamden Auto Const mandatory
ReferenceAlias Property Alias_CoffeeLinden Auto Const mandatory
ReferenceAlias Property Alias_CoffeeGenevieve Auto Const mandatory
ReferenceAlias Property Alias_CoffeeAlexis Auto Const mandatory
ReferenceAlias Property Alias_CoffeeImogene Auto Const mandatory
ReferenceAlias Property Alias_ImogeneSalzo Auto Const mandatory
Potion Property RI01_YukoCoffee Auto Const mandatory
ActorValue Property RI01_Completed Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
ReferenceAlias Property Alias_YukoSerrano Auto Const mandatory
ReferenceAlias Property Alias_RyujinPlayerChair Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewEmployee Auto Const mandatory
ReferenceAlias Property Alias_NeonTerraBrewTomoStartMarker Auto Const mandatory
ActorValue Property Confidence Auto Const mandatory
ActorValue Property Assistance Auto Const mandatory
ReferenceAlias Property Alias_PathingOperative Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_NeonStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_YukoSerrano.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_NewAtlantisStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_YukoSerrano.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  Self.SetStage(100)
  Self.SetStage(150)
  Self.SetStage(200)
  Alias_YukoSerrano.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0003_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  Self.SetStage(500)
  Alias_YukoSerrano.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0004_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  Alias_AlexisPryce.GetRef().MoveTo(Alias_RyujinAlexisConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_CamdenCho.GetRef().MoveTo(Alias_RyujinCamdenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_GenevieveMonohan.GetRef().MoveTo(Alias_RyujinGenevieveConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_LindenCalderi.GetRef().MoveTo(Alias_RyujinLindenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(800)
  Game.GetPlayer().MoveTo(Alias_RyujinImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_YukoSerrano.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0005_Item_00()
  LC044.SetStage(350)
  LC044.SetStage(400)
  Self.SetStage(800)
  Alias_YukoSerrano.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False)
  Alias_YukoSerrano.GetRef().Disable(False)
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayed(150, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True)
  Self.SetObjectiveDisplayedAtTop(200)
  If Self.IsObjectiveDisplayed(150)
    Self.SetObjectiveCompleted(150, True)
  EndIf
  LC044.SetStage(350)
  LC044.SetStage(400)
EndFunction

Function Fragment_Stage_0210_Item_00()
  RI01_200_Lane_GreetingScene.Start()
  Self.SetObjectiveDisplayed(210, True, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(220)
  Self.SetObjectiveDisplayed(230, True, False)
  Alias_LaneGarza.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0235_Item_00()
  RI01_230_Lane_FollowScene.Start()
  Alias_PathingOperative.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Self.SetObjectiveCompleted(230, True)
EndFunction

Function Fragment_Stage_0250_Item_00()
  RI01_250_Imogene_IntroScene.Start()
  Alias_LaneGarza.GetActorRef().EvaluatePackage(False)
  If Self.IsObjectiveDisplayed(210)
    Self.SetObjectiveDisplayed(210, False, False)
  EndIf
EndFunction

Function Fragment_Stage_0260_Item_00()
  Alias_PathingOperative.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.IsObjectiveDisplayed(230)
    Self.SetObjectiveDisplayed(230, False, False)
  EndIf
  Self.SetObjectiveCompleted(200, True)
  Self.SetObjectiveDisplayed(300, True, False)
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest
  ri01_questscript kmyQuest = __temp as ri01_questscript
  kmyQuest.FreezeControls()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True)
  Self.SetObjectiveDisplayed(400, True, False)
  If Self.IsObjectiveDisplayed(210)
    Self.SetObjectiveDisplayed(210, False, False)
  EndIf
  Utility.Wait(3.0)
  RI01_250_Imogene_IntroScene.Stop()
  RI01_400_Imogene_InterviewScene.Start()
EndFunction

Function Fragment_Stage_0410_Item_00()
  RI01_Track_PlayerWhateverItTakes.SetValue(1.0)
EndFunction

Function Fragment_Stage_0411_Item_00()
  RI01_Track_PlayerWillRunThePlace.SetValue(1.0)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest
  ri01_questscript kmyQuest = __temp as ri01_questscript
  Self.SetObjectiveCompleted(400, True)
  Self.SetObjectiveDisplayed(500, True, False)
  kmyQuest.UnfreezeControls()
  Game.GetPlayer().AddPerk(FactionRyujinIndustriesPerk, False)
  PlayerJoined_Ryujin.SetValue(1.0)
  PlayerFaction.SetAlly(RyujinIndustriesFaction, False, False)
  RI01_JobAdRadio.SetStage(1000)
  Alias_NeonTerraBrewCustomer01.GetRef().Enable(False)
  Alias_NeonTerraBrewCustomer01.GetRef().MoveTo(Alias_NeonTerraBrewSceneMarker01.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_NeonTerraBrewCustomer02.TryToEnable()
  Alias_NeonTerraBrewCustomer03.TryToEnable()
  Alias_NeonTerraBrewCustomer04.TryToEnable()
  ObjectReference ChairRef = Alias_RyujinPlayerChair.GetRef()
  If ChairRef.IsFurnitureInUse(False)
    ChairRef.Activate(Game.GetPlayer() as ObjectReference, False)
  EndIf
  Actor TBEmployeeRef = Alias_NeonTerraBrewEmployee.GetActorRef()
  TBEmployeeRef.RemoveFromFaction(CrimeFactionNeon)
  TBEmployeeRef.AddAliasedItem(RI01_TerraBrewOrder as Form, Alias_TerraBrewCoffeeOrder as Alias, 1, True)
  TBEmployeeRef.SetValue(Assistance, 0.0)
EndFunction

Function Fragment_Stage_0515_Item_00()
  RI01_500_Customer02_CommentScene.Start()
EndFunction

Function Fragment_Stage_0516_Item_00()
  RI01_500_Customer03_CommentScene.Start()
EndFunction

Function Fragment_Stage_0520_Item_00()
  Actor TomoRef = Alias_TomoHigashi.GetActorRef()
  TomoRef.Enable(False)
  Game.GetPlayer().StopCombatAlarm()
  RI01_500_Tomo_ConfrontationScene.Start()
  Alias_NeonTerraBrewEmployee.Clear()
EndFunction

Function Fragment_Stage_0530_Item_00()
  If Self.GetStageDone(700)
    Self.SetStage(800)
  EndIf
EndFunction

Function Fragment_Stage_0550_Item_00()
  Alias_TomoHigashi.GetRef().Enable(False)
  Alias_TomoHigashi.GetActorRef().SetEssential(True)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True)
  Self.SetObjectiveDisplayed(600, True, False)
  Actor TBEmployeeRef = Alias_NeonTerraBrewEmployee.GetActorRef()
  TBEmployeeRef.AddToFaction(CrimeFactionNeon)
  TBEmployeeRef.SetCrimeFaction(CrimeFactionNeon)
EndFunction

Function Fragment_Stage_0628_Item_00()
  RI01_Track_PlayerPromisedTomo.SetValue(1.0)
EndFunction

Function Fragment_Stage_0629_Item_00()
  RI01_Track_PlayerPromisedTomo.SetValue(2.0)
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(630, True, False)
  Actor TomoRef = Alias_TomoHigashi.GetActorRef()
  TomoRef.SetEssential(False)
  TomoRef.RemoveFromFaction(CrimeFactionNeon)
  TomoRef.AddToFaction(PlayerEnemyFaction)
  TomoRef.SetValue(Confidence, 4.0)
  TomoRef.SetValue(Aggression, 2.0)
  TomoRef.StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0640_Item_00()
  Alias_TomoHigashi.GetActorRef().SetProtected(False)
  Alias_TomoHigashi.GetActorRef().Kill(None)
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(630, True)
  Self.SetStage(700)
  RI01_TomoDead.SetValue(1.0)
  Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage(False)
  Alias_TomoHigashi.Clear()
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(600, True)
  Self.SetObjectiveDisplayed(700, True, False)
  If !Self.GetStageDone(520)
    RI01_700_Companion_TomoPromiseScene.Start()
  EndIf
  If Self.GetStageDone(530)
    Self.SetStage(800)
  EndIf
  Actor TomoRef = Alias_TomoHigashi.GetActorRef()
  TomoRef.SetEssential(False)
  TomoRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0705_Item_00()
  Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0710_Item_00()
  Game.GetPlayer().AddItem(Alias_TerraBrewCoffeeOrder.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(700, True)
  Self.SetObjectiveDisplayed(800, True, False)
  Alias_NeonTerraBrewEmployee.GetActorRef().EvaluatePackage(False)
  Alias_AlexisPryce.GetRef().MoveTo(Alias_RyujinAlexisConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_CamdenCho.GetRef().MoveTo(Alias_RyujinCamdenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_GenevieveMonohan.GetRef().MoveTo(Alias_RyujinGenevieveConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
  Alias_LindenCalderi.GetRef().MoveTo(Alias_RyujinLindenConferenceChair.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True)
  Self.SetStage(900)
  Self.SetStage(1000)
  Self.SetStage(1100)
  Self.SetStage(1200)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference
  PlayerRef.AddItem(RI01_YukoCoffee as Form, 1, True)
  PlayerRef.AddAliasedItem(RI01_ImogeneCoffee as Form, Alias_CoffeeImogene as Alias, 1, True)
  PlayerRef.RemoveItem(RI01_ImogeneCoffee as Form, 1, False, None)
  Alias_ImogeneSalzo.GetRef().AddItem(RI01_ImogeneCoffee as Form, 1, False)
  PlayerRef.RemoveItem(RI01_TerraBrewOrder as Form, 99, True, None)
  PlayerRef.AddAliasedItem(RI01_AlexisCoffee as Form, Alias_CoffeeAlexis as Alias, 1, True)
  PlayerRef.AddAliasedItem(RI01_CamdenCoffee as Form, Alias_CoffeeCamden as Alias, 1, True)
  PlayerRef.AddAliasedItem(RI01_GenevieveCoffee as Form, Alias_CoffeeGenevieve as Alias, 1, True)
  PlayerRef.AddAliasedItem(RI01_LindenCoffee as Form, Alias_CoffeeLinden as Alias, 1, True)
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False)
EndFunction

Function Fragment_Stage_0905_Item_00()
  Game.GetPlayer().RemoveItem(RI01_AlexisCoffee as Form, 1, False, None)
  Alias_AlexisPryce.GetRef().AddItem(RI01_AlexisCoffee as Form, 1, False)
EndFunction

Function Fragment_Stage_0910_Item_00()
  PlayerKnows_Bayu.SetValue(1.0)
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(900, True)
  If Self.GetStageDone(1050) && Self.GetStageDone(1150) && Self.GetStageDone(1250)
    Self.SetStage(1300)
  EndIf
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(1300, True)
  Game.AddAchievement(17)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveDisplayed(1000, True, False)
EndFunction

Function Fragment_Stage_1005_Item_00()
  Game.GetPlayer().RemoveItem(RI01_CamdenCoffee as Form, 1, False, None)
  Alias_CamdenCho.GetRef().AddItem(RI01_CamdenCoffee as Form, 1, False)
EndFunction

Function Fragment_Stage_1050_Item_00()
  Self.SetObjectiveCompleted(1000, True)
  If Self.GetStageDone(950) && Self.GetStageDone(1150) && Self.GetStageDone(1250)
    Self.SetStage(1300)
  EndIf
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.SetObjectiveDisplayed(1100, True, False)
EndFunction

Function Fragment_Stage_1105_Item_00()
  Game.GetPlayer().RemoveItem(RI01_GenevieveCoffee as Form, 1, False, None)
  Alias_GenevieveMonohan.GetRef().AddItem(RI01_GenevieveCoffee as Form, 1, False)
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.SetObjectiveCompleted(1100, True)
  If Self.GetStageDone(950) && Self.GetStageDone(1050) && Self.GetStageDone(1250)
    Self.SetStage(1300)
  EndIf
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.SetObjectiveDisplayed(1200, True, False)
EndFunction

Function Fragment_Stage_1205_Item_00()
  Game.GetPlayer().RemoveItem(RI01_LindenCoffee as Form, 1, False, None)
  Alias_LindenCalderi.GetRef().AddItem(RI01_LindenCoffee as Form, 1, False)
EndFunction

Function Fragment_Stage_1250_Item_00()
  Self.SetObjectiveCompleted(1200, True)
  If Self.GetStageDone(950) && Self.GetStageDone(1050) && Self.GetStageDone(1150)
    Self.SetStage(1300)
  EndIf
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.SetObjectiveDisplayed(1300, True, False)
  RIR01.Start()
EndFunction
