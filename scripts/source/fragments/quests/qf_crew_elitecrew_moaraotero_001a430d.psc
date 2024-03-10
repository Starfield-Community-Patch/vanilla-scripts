ScriptName Fragments:Quests:QF_CREW_EliteCrew_MoaraOtero_001A430D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Moara Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ102 Auto Const
Perk Property CREW_Ship_Weapons_EM Auto Const
Perk Property Crew_Marksmanship Auto Const
Perk Property CREW_Ship_Weapons_Missile Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ102.SetStage(2000)
  MQ102.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Moara.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Moara.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Actor MoaraRef = Moara.GetActorRef()
  MoaraRef.SetFactionRank(PotentialCrewFaction, 1)
  MoaraRef.AddPerk(CREW_Ship_Weapons_EM, False)
  MoaraRef.AddPerk(Crew_Marksmanship, False)
  MoaraRef.AddPerk(CREW_Ship_Weapons_EM, False)
  MoaraRef.AddPerk(Crew_Marksmanship, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(800)
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
