ScriptName Fragments:Quests:QF_TraitUnwantedHero_000EFFCF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Trait_UH_FollowerGlobal Auto Const mandatory
ReferenceAlias Property Alias_AdoringFan Auto Const mandatory
MiscObject Property ToiletPaperRoll01Empty Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
LeveledItem Property LL_Trait_UH_AdoringFanGift Auto Const mandatory
Perk Property TRAIT_UnwantedHero Auto Const
ReferenceAlias Property Alias_NewAtlantisMarker Auto Const mandatory
ReferenceAlias Property Alias_AkilaCityMarker Auto Const mandatory
ReferenceAlias Property Alias_NeonMarker Auto Const mandatory
Scene Property TraitUnwantedHero_AttackedByPlayer Auto Const mandatory
Int Property FollowPlayerOnStartOdds Auto Const mandatory
Quest Property Trait_UH_SpeechChallengeQuest Auto Const mandatory
ReferenceAlias Property Alias_FanDisplayName Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Scene Property TraitUnwantedHero_DialogueGreets Auto Const mandatory
Quest Property CREW_EliteCrew_AdoringFan Auto Const
Message Property Trait_UH_WarningMessageEssential Auto Const mandatory
ReferenceAlias Property Alias_NATMarker Auto Const mandatory
GlobalVariable Property Trait_UH_FanClubFee Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
GlobalVariable Property Trait_UH_HitGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Trait_UH_SpeechChallengeQuest.Start()
  Alias_AdoringFan.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_AdoringFan.GetRef().MoveTo(Alias_NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0001_Item_01()
  Self.SetStage(4)
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_AdoringFan.GetRef().MoveTo(Alias_NeonMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0002_Item_01()
  Self.SetStage(4)
EndFunction

Function Fragment_Stage_0003_Item_00()
  Alias_AdoringFan.GetRef().MoveTo(Alias_AkilaCityMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(30)
EndFunction

Function Fragment_Stage_0003_Item_01()
  Self.SetStage(4)
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_AdoringFan.GetActorRef().EvaluatePackage(False)
  CREW_EliteCrew_AdoringFan.Start()
EndFunction

Function Fragment_Stage_0007_Item_00()
  TraitUnwantedHero_AttackedByPlayer.Start()
EndFunction

Function Fragment_Stage_0009_Item_00()
  Game.GetPlayer().AddPerk(TRAIT_UnwantedHero, False)
  Game.GetPlayer().MoveTo(Alias_AdoringFan.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  Trait_UH_FollowerGlobal.SetValue(2.0)
  CREW_EliteCrew_AdoringFan.SetStage(50)
EndFunction

Function Fragment_Stage_0011_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  Trait_UH_FollowerGlobal.SetValue(0.0)
  CREW_EliteCrew_AdoringFan.SetStage(15)
  FanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0012_Item_00()
  Trait_UH_FollowerGlobal.SetValue(2.0)
EndFunction

Function Fragment_Stage_0013_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  SQ_Followers.SetRoleInactive(FanRef, True, False, True)
  FanRef.MoveTo(Alias_NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  FanRef.EvaluatePackage(False)
  Trait_UH_FollowerGlobal.SetValue(0.0)
EndFunction

Function Fragment_Stage_0014_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  SQ_Followers.SetRoleInactive(FanRef, True, False, True)
  FanRef.MoveTo(Alias_NeonMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  FanRef.EvaluatePackage(False)
  Trait_UH_FollowerGlobal.SetValue(0.0)
EndFunction

Function Fragment_Stage_0015_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  SQ_Followers.SetRoleInactive(FanRef, True, False, True)
  FanRef.MoveTo(Alias_AkilaCityMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  FanRef.EvaluatePackage(False)
  Trait_UH_FollowerGlobal.SetValue(0.0)
EndFunction

Function Fragment_Stage_0016_Item_00()
  Trait_UH_FollowerGlobal.SetValue(0.0)
EndFunction

Function Fragment_Stage_0017_Item_00()
  TraitUnwantedHero_DialogueGreets.Start()
EndFunction

Function Fragment_Stage_0018_Item_00()
  Trait_UH_HitGlobal.Mod(1.0)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Trait_UH_FollowerGlobal.SetValue(2.0)
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  SQ_Followers.SetRoleActive(FanRef, True, True, 0.0, 0.0)
  FanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0020_Item_01()
  Trait_UH_FollowerGlobal.SetValue(2.0)
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  SQ_Followers.CommandFollow(FanRef)
  FanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Trait_UH_FollowerGlobal.SetValue(1.0)
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  SQ_Followers.CommandWait(FanRef, None)
  FanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Int random = Utility.RandomInt(0, 100)
  If Self.GetStageDone(5) && random < FollowPlayerOnStartOdds
    Trait_UH_FollowerGlobal.SetValue(4.0)
  Else
    Trait_UH_FollowerGlobal.SetValue(3.0)
  EndIf
  Trait_UH_HitGlobal.SetValue(0.0)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().AddItem(LL_Trait_UH_AdoringFanGift as Form, 1, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().RemovePerk(TRAIT_UnwantedHero)
  Alias_FanDisplayName.ForceRefTo(Alias_AdoringFan.GetRef())
  Self.SetStage(11)
EndFunction

Function Fragment_Stage_0065_Item_00()
  Trait_UH_WarningMessageEssential.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor PlayerRef = Game.GetPlayer()
  PlayerRef.AddItem(ToiletPaperRoll01Empty as Form, 1, False)
  PlayerRef.AddItem(Credits as Form, 50, False)
EndFunction

Function Fragment_Stage_0075_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  FanRef.EnableNoWait(False)
  FanRef.SetProtected(True)
  FanRef.EvaluatePackage(False)
  Alias_NATMarker.Clear()
EndFunction

Function Fragment_Stage_0085_Item_00()
  Actor FanRef = Alias_AdoringFan.GetActorRef()
  FanRef.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0666_Item_00()
  Self.SetStage(50)
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.SetStage(50)
  CREW_EliteCrew_AdoringFan.SetStage(9999)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_AdoringFan.GetRef().DisableNoWait(False)
  CREW_EliteCrew_AdoringFan.Stop()
  Trait_UH_SpeechChallengeQuest.Stop()
  Self.Stop()
EndFunction
