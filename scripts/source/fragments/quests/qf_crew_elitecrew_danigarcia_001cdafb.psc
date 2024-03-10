ScriptName Fragments:Quests:QF_CREW_EliteCrew_DaniGarcia_001CDAFB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Dani Auto Const
Faction Property PotentialCrewFaction Auto Const
MiscObject Property Credits Auto Const
GlobalVariable Property CREW_DaniGarciaCreditAmount Auto Const mandatory
GlobalVariable Property Crew_RecruitCost_TextReplacementValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1)
  Self.SetStage(50)
  (Dani.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew()
  Dani.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0001_Item_00()
  Dani.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.RecruitedUnasssigned()
  CREW_DaniGarciaCreditAmount.SetValue(Crew_RecruitCost_TextReplacementValue.GetValueInt() as Float)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.SetCostMultAndUpdateCost(0.5)
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.SetCostMultAndUpdateCost(1.0)
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript
  kmyQuest.StartBackstoryTimer()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, CREW_DaniGarciaCreditAmount.GetValueInt(), False)
EndFunction
