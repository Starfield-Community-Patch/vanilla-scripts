ScriptName Fragments:Quests:QF_DialogueGagarin_UC_GG_00265062 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueGagarin_GG_IntroScene_TakeTwo Auto Const mandatory
ReferenceAlias Property Alias_Dalitso Auto Const mandatory
ReferenceAlias Property Alias_Bonifac Auto Const mandatory
ReferenceAlias Property Alias_Lawan Auto Const mandatory
Perk Property BackgroundHunter Auto Const mandatory
GlobalVariable Property UC_GG_Bet_PlayerNegotiatedBonus Auto Const mandatory
Quest Property City_GG_Bet Auto Const mandatory
MiscObject Property UC_GG_Bet_Liquor Auto Const mandatory
Perk Property BackgroundExplorer Auto Const mandatory
ReferenceAlias Property Alias_DalitsoPoster Auto Const mandatory
ReferenceAlias Property Alias_EllieYankton Auto Const mandatory
ReferenceAlias Property Alias_KealaPoster Auto Const mandatory
ReferenceAlias Property Alias_LizziePoster Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddPerk(BackgroundHunter, False)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddPerk(BackgroundExplorer, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueGagarin_GG_IntroScene_TakeTwo.Start()
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Dalitso.GetActorRef().EvaluatePackage(False)
  Utility.Wait(1.0)
  Alias_Lawan.GetActorRef().EvaluatePackage(False)
  Utility.Wait(0.5)
  Alias_Bonifac.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0220_Item_00()
  UC_GG_Bet_PlayerNegotiatedBonus.SetValue(1.0)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Bet_Liquor as Form, 1, False, None)
  Self.SetStage(220)
  City_GG_Bet.SetStage(100)
  Utility.Wait(1.0)
  City_GG_Bet.SetStage(1000)
EndFunction

Function Fragment_Stage_0800_Item_00()
  If DialogueGagarin_GG_IntroScene_TakeTwo.IsPlaying()
    DialogueGagarin_GG_IntroScene_TakeTwo.Stop()
  EndIf
EndFunction

Function Fragment_Stage_1101_Item_00()
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_1102_Item_00()
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_1103_Item_00()
  Self.SetStage(1100)
EndFunction

Function Fragment_Stage_1205_Item_00()
  Alias_DalitsoPoster.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1215_Item_00()
  Alias_KealaPoster.GetRef().Enable(False)
EndFunction

Function Fragment_Stage_1225_Item_00()
  Alias_LizziePoster.GetRef().Enable(False)
EndFunction
