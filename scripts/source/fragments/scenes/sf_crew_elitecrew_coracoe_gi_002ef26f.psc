ScriptName Fragments:Scenes:SF_CREW_EliteCrew_CoraCoe_Gi_002EF26F Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Cora Auto Const mandatory
FormList Property BookFormList Auto Const mandatory
Keyword Property BookKeyword Auto Const mandatory
GlobalVariable Property CoraBookGlobal Auto Const mandatory
Scene Property CREW_EliteCrew_CoraCoe_GiveBooks Auto Const mandatory
Int Property XPperbook Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  com_corabookguard kmyQuest = Self.GetOwningQuest() as com_corabookguard
  kmyQuest.CheckCountAndOpenMenu()
EndFunction

Function Fragment_Phase_03_End()
  com_corabookguard kmyQuest = Self.GetOwningQuest() as com_corabookguard
  kmyQuest.CalculateReward()
EndFunction
