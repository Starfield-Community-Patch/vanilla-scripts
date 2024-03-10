ScriptName Fragments:Quests:QF_CREW_EliteCrew_ErickvonPr_00196BAE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Erick Auto Const
Faction Property PotentialCrewFaction Auto Const
Perk Property CREW_Ship_Piloting Auto Const
Quest Property CityCY_Startup01 Auto Const
Perk Property CREW_Ship_Payloads Auto Const
Perk Property CREW_Ship_Astrodynamics Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CityCY_Startup01.SetStage(410)
  CityCY_Startup01.Stop()
  Self.SetStage(1)
  Self.SetStage(50)
  (Erick.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Erick.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  Actor ErickRef = Erick.GetActorRef()
  ErickRef.SetFactionRank(PotentialCrewFaction, 1)
  ErickRef.AddPerk(CREW_Ship_Payloads, False)
  ErickRef.AddPerk(CREW_Ship_Astrodynamics, False)
  ErickRef.AddPerk(CREW_Ship_Astrodynamics, False)
  kmyQuest.SetCostMultAndUpdateCost(0.0)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
EndFunction

Function Fragment_Stage_0600_Item_00()
  Erick.GetActorRef().AddPerk(CREW_Ship_Piloting, False)
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction
