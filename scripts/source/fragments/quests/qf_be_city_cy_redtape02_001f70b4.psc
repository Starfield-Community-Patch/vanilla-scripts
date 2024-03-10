ScriptName Fragments:Quests:QF_BE_City_CY_RedTape02_001F70B4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_CY_RedTape02 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Faction Property CityCYRedTape02CrimsonFleetNeutralFaction Auto Const mandatory
Topic Property BE_City_CY_RedTape02_Captain_TimesUpTopic Auto Const mandatory
ReferenceAlias Property Alias_Note Auto Const mandatory
Quest Property City_CY_RedTape02_Blackmail Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ActorValue Property SpaceshipGravJumpFuel Auto Const mandatory
Scene Property BE_City_CY_RedTape02_Captain_0020_ForceGreet Auto Const mandatory
Scene Property BE_City_CY_RedTape02_Captain_0020_TimesUp Auto Const mandatory
ActorValue Property City_CY_RedTape02_Foreknowledge_PirateAV Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Alias_Corpse.GetActorRef().Kill(None)
  City_CY_RedTape02.SetStage(610)
  Alias_AllCrew.EvaluateAll()
  Alias_Captain.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript
  kmyQuest.StartCountdown()
EndFunction

Function Fragment_Stage_0031_Item_00()
  Quest __temp = Self as Quest
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript
  kmyQuest.StopCountdown()
EndFunction

Function Fragment_Stage_0032_Item_00()
  BE_City_CY_RedTape02_Captain_0020_ForceGreet.Stop()
  Alias_Captain.GetRef().Say(BE_City_CY_RedTape02_Captain_TimesUpTopic, None, False, None)
  Utility.Wait(5.0)
  Self.SetStage(90)
EndFunction

Function Fragment_Stage_0033_Item_00()
  BE_City_CY_RedTape02_Captain_0020_ForceGreet.Stop()
  Self.SetStage(90)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetStage(50)
  Game.GetPlayer().AddItem(Alias_Note.GetRef() as Form, 1, False)
EndFunction

Function Fragment_Stage_0041_Item_00()
  Quest __temp = Self as Quest
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript
  kmyQuest.RemoveShipParts()
EndFunction

Function Fragment_Stage_0042_Item_00()
  Quest __temp = Self as Quest
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript
  kmyQuest.RemoveShipParts()
EndFunction

Function Fragment_Stage_0050_Item_00()
  City_CY_RedTape02.SetStage(616)
  City_CY_RedTape02.SetStage(620)
  City_CY_RedTape02.SetStage(700)
  Alias_Captain.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0090_Item_00()
  Alias_AllCrew.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)
  Actor myCaptain = Alias_Captain.GetActorRef()
  myCaptain.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)
  Alias_AllCrew.EvaluateAll()
  myCaptain.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(150)
    City_CY_RedTape02.SetStage(615)
  EndIf
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Self.GetStageDone(100)
    City_CY_RedTape02.SetStage(615)
  EndIf
EndFunction

Function Fragment_Stage_0200_Item_00()
  City_CY_RedTape02.SetStage(620)
  City_CY_RedTape02.SetStage(630)
  City_CY_RedTape02_Blackmail.Start()
EndFunction

Function Fragment_Stage_0201_Item_00()
  City_CY_RedTape02.SetStage(620)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest
  becitycyredtape02questscript kmyQuest = __temp as becitycyredtape02questscript
  kmyQuest.ShipUndock()
EndFunction
