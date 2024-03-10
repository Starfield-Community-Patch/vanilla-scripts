ScriptName Fragments:Quests:QF_MQ207C_RafaelPostquest_00051687 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RafaelAguerro Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
LocationAlias Property Alias_playerShipInteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_RafaelAguerroPost Auto Const mandatory
Quest Property CREW_EliteCrew_RafaelAguerro Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0200_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0020_Item_00()
  SQ_Followers.SetRoleActive(Alias_RafaelAguerro.GetActorRef(), True, True, 0.0, 0.0)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Actor rafael = Alias_RafaelAguerro.GetActorRef()
  SQ_Followers.SetRoleInactive(rafael, True, False, True)
  kmyQuest.AddPassenger(Alias_RafaelAguerro)
  If rafael.GetCurrentLocation() != Alias_playerShipInteriorLocation.GetLocation()
    rafael.EvaluatePackage(False)
    rafael.MoveToPackageLocation()
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
  Actor rafael = Alias_RafaelAguerro.GetActorRef()
  kmyQuest.RemovePassengerActor(rafael)
  rafael.DisableNoWait(False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_RafaelAguerro.GetActorRef().DisableNoWait(False)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0210_Item_00()
  CREW_EliteCrew_RafaelAguerro.SetStage(1)
  Self.SetObjectiveDisplayed(210, True, False)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(210, True)
  Self.CompleteQuest()
  Self.Stop()
EndFunction
