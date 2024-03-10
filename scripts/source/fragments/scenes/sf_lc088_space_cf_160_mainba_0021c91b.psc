ScriptName Fragments:Scenes:SF_LC088_Space_CF_160_MainBa_0021C91B Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Faction Property UCSysDefFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  UCSysDefFaction.SetAlly(PlayerFaction, True, True)
  UCSysDefFaction.SetAlly(CrimeFactionCrimsonFleet, True, True)
EndFunction

Function Fragment_End()
  lc088_spacequestscript kmyQuest = Self.GetOwningQuest() as lc088_spacequestscript
  UCSysDefFaction.SetEnemy(PlayerFaction, False, False)
  UCSysDefFaction.SetEnemy(CrimeFactionCrimsonFleet, False, False)
  kmyQuest.SetStageNoWait(161)
EndFunction
