ScriptName Fragments:Quests:QF_SE_AC01_EliteCrewEncounte_0005B4B0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BettyHailScene Auto Const
ActorValue Property DockingPermission Auto Const
ReferenceAlias Property BettyShip Auto Const
ReferenceAlias Property Betty Auto Const
ReferenceAlias Property NewAtlantisMarker Auto Const
ReferenceAlias Property BettyShipMarker Auto Const
Quest Property BettyECQuest Auto Const
Scene Property SE_AC01_000_BettyInitialComment Auto Const mandatory
Scene Property SE_AC01_LuckyLuGoodbye Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
LocationAlias Property Alias_OrbitLocation Auto Const mandatory
Keyword Property LocTypeSENotAllowed Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0005_Item_00()
  Betty.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0010_Item_00()
  SE_AC01_000_BettyInitialComment.Start()
EndFunction

Function Fragment_Stage_0015_Item_00()
  BettyECQuest.SetStage(45)
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveDisplayed(20, True, False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest
  defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript
  Self.SetObjectiveCompleted(20, True)
  BettyECQuest.SetStage(40)
  spaceshipreference BettyShipRef = BettyShip.GetShipRef()
  BettyShipRef.SetValue(SpaceshipCrew, 0.0)
  SQ_Parent.SetupDamagedShip(BettyShipRef, False, True, True, True, True, True, None)
  If !BettyECQuest.GetStageDone(50)
    Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None)
  EndIf
EndFunction

Function Fragment_Stage_0040_Item_00()
  BettyECQuest.SetStage(1)
EndFunction

Function Fragment_Stage_0050_Item_00()
  BettyShip.GetShipRef().SetValue(DockingPermission, 4.0)
  Betty.GetActorRef().MoveTo(NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
  Self.SetStage(1000)
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.GetStageDone(50)
    BettyShip.GetShipRef().DisableWithGravJump()
    Alias_MapMarker.GetRef().DisableNoWait(False)
  Else
    SE_AC01_LuckyLuGoodbye.Start()
  EndIf
EndFunction

Function Fragment_Stage_2000_Item_00()
  Betty.GetRef().MoveTo(NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_2000_Item_01()
  BettyShip.GetShipRef().DisableNoWait(False)
  Alias_OrbitLocation.GetLocation().RemoveKeyword(LocTypeSENotAllowed)
  Self.Stop()
EndFunction
