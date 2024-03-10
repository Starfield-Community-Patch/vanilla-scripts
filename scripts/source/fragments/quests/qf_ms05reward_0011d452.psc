ScriptName Fragments:Quests:QF_MS05Reward_0011D452 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS05ShipDesign Auto Const mandatory
ReferenceAlias Property Alias_SensibleShip Auto Const mandatory
ReferenceAlias Property Alias_RidiculousShip Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If MS05ShipDesign.GetValue() >= 0.0
    Self.SetStage(100)
  Else
    Self.SetStage(200)
  EndIf
EndFunction

Function Fragment_Stage_0100_Item_00()
  spaceshipreference myShip = Alias_SensibleShip.GetShipRef()
  myShip.SetValue(SpaceshipCrew, 0.0)
  myShip.SetValue(SpaceshipRegistration, 1.0)
  myShip.Enable(False)
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript
  SQ_PlayerShip.AddPlayerOwnedShip(myShip)
  Self.SetObjectiveDisplayed(100, True, False)
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference myShip = Alias_RidiculousShip.GetShipRef()
  myShip.SetValue(SpaceshipCrew, 0.0)
  myShip.SetValue(SpaceshipRegistration, 1.0)
  myShip.Enable(False)
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript
  SQ_PlayerShip.AddPlayerOwnedShip(myShip)
  Self.SetObjectiveDisplayed(200, True, False)
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives()
  MQ_TutorialQuest.SetStage(300)
  Self.Stop()
EndFunction

Function Fragment_Stage_1001_Item_00()
  Self.CompleteAllObjectives()
  Self.Stop()
EndFunction
