ScriptName Fragments:Quests:QF_FC01_PostQuest_01002314 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityAkilaCityLocation Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ReferenceAlias Property Alias_JedBullock Auto Const mandatory
ReferenceAlias Property Alias_Robber02 Auto Const mandatory
ReferenceAlias Property Alias_Robber03 Auto Const mandatory
ReferenceAlias Property Alias_Robber04 Auto Const mandatory
ReferenceAlias Property Alias_Robber05 Auto Const mandatory
ReferenceAlias Property Alias_Robber06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_2000_Item_00()
  If !Alias_Player.GetRef().IsInLocation(CityAkilaCityLocation)
    Alias_JedBullock.GetActorRef().Disable(False)
    Alias_Robber02.GetActorRef().Disable(False)
    Alias_Robber03.GetActorRef().Disable(False)
    Alias_Robber04.GetActorRef().Disable(False)
    Alias_Robber05.GetActorRef().Disable(False)
    Alias_Robber06.GetActorRef().Disable(False)
    Self.Stop()
  EndIf
EndFunction
