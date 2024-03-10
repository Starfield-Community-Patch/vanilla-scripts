ScriptName Fragments:Quests:QF_MQ302a_00255DAB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EmissaryShip Auto Const mandatory
ReferenceAlias Property Alias_HunterShip Auto Const mandatory
Faction Property MQ_HunterFaction Auto Const mandatory
Faction Property MQ_EmissaryFaction Auto Const mandatory
GlobalVariable Property MQ_SidedWithEmissary Auto Const mandatory
GlobalVariable Property MQ_SidedWithHunter Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Quest Property MQ304 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property MQ_HunterAllyFaction Auto Const mandatory
Faction Property MQ_EmissaryAllyFaction Auto Const mandatory
ObjectReference Property MQ302ScorpiusMoveMarker Auto Const mandatory
ObjectReference Property MQ302HelixMoveMarker Auto Const mandatory
ObjectReference Property MQ302_EmissaryShipLanding Auto Const mandatory
ObjectReference Property MQ302_HunterShipLanding Auto Const mandatory
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
ObjectReference Property MQ302Start Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Quest Property MQ304b Auto Const mandatory
Quest Property MQ301 Auto Const mandatory
Location Property LC165BuriedTempleSpaceLocation Auto Const mandatory
Location Property LC165BuriedTempleLocation Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory
ObjectReference Property ScorpiusOborumMarker Auto Const mandatory
ObjectReference Property MQ207_EmissaryMarker01 Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQ303EmissaryMarker01 Auto Const mandatory
Scene Property MQ302_001_EmissaryHunter Auto Const mandatory
ObjectReference Property MQ301EmissaryHunterMoveToMarker Auto Const mandatory
Quest Property MQ207B Auto Const mandatory
Faction Property MQEmissaryHunterCrimeFaction Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Faction Property MQHunterCrimeFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2)
  MQ101.SetStage(1800)
  MQ101.SetStage(1810)
  Game.GetPlayer().moveto(MQ302Start, 0.0, 0.0, 0.0, True, False)
  MQ301.SetStage(400)
  Self.SetStage(10)
  MQ207B.SetStage(10)
EndFunction

Function Fragment_Stage_0010_Item_00()
  spaceshipreference HunterShipREF = Alias_HunterShip.GetShipReference()
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  HunterShipREF.moveto(MQ302_HunterShipLanding, 0.0, 0.0, 0.0, True, False)
  EmissaryShipREF.moveto(MQ302_EmissaryShipLanding, 0.0, 0.0, 0.0, True, False)
  HunterShipREF.Enable(False)
  EmissaryShipREF.Enable(False)
  HunterREF.Disable(False)
  HunterREF.EvaluatePackage(False)
  HunterREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False)
  HunterREF.Enable(False)
  EmissaryREF.Disable(False)
  EmissaryREF.EvaluatePackage(False)
  EmissaryREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False)
  EmissaryREF.Enable(False)
  MQ304b.Start()
  HunterREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
  EmissaryREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction)
EndFunction

Function Fragment_Stage_0015_Item_00()
  spaceshipreference HunterShipREF = Alias_HunterShip.GetShipReference()
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()
  HunterShipREF.Enable(False)
  EmissaryShipREF.Enable(False)
  Self.SetObjectiveDisplayed(15, True, False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ302_001_EmissaryHunter.Start()
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ302_SidedWithChoice.SetValueInt(0)
  MQ301.SetStage(500)
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()
  EmissaryShipREF.SetValue(DockingPermission, 1.0)
  Game.GetPlayer().addtoFaction(MQ_EmissaryAllyFaction)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0105_Item_00()
  MQ304b.SetStage(5)
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ302_SidedWithChoice.SetValueInt(1)
  MQ301.SetStage(500)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.StopDialogueCamera(False, False)
  MQ302_001_EmissaryHunter.Stop()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
  EmissaryREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True)
  HunterREF.moveto(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False)
  EmissaryREF.moveto(MQ303EmissaryMarker01, 0.0, 0.0, 0.0, True, False)
  MQ302_SidedWithChoice.SetValueInt(2)
  MQ301.SetStage(500)
  Self.SetStage(200)
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference HunterShipREF = Alias_HunterShip.GetShipReference()
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference()
  Actor HunterREF = Alias_Hunter.GetActorRef()
  Actor EmissaryREF = Alias_Emissary.GetActorRef()
  HunterShipREF.EvaluatePackage(False)
  EmissaryShipREF.EvaluatePackage(False)
  If Self.GetStageDone(110) == False
    MQ304b.Stop()
  EndIf
  HunterREF.SetCrimeFaction(MQHunterCrimeFaction)
  EmissaryREF.SetCrimeFaction(None)
  HunterREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
  EmissaryREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction)
EndFunction

Function Fragment_Stage_1000_Item_01()
  spaceshipreference HelixREF = Alias_EmissaryShip.GetShipRef()
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef()
  ScorpiusREF.DisableNoWait(False)
  HelixREF.moveto(HelixOborumMarker, 0.0, 0.0, 0.0, True, False)
  HelixREF.Enable(False)
  Alias_Emissary.GetActorRef().moveto(MQ207_EmissaryMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1000_Item_02()
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef()
  spaceshipreference HelixREF = Alias_EmissaryShip.GetShipRef()
  HelixREF.DisableNoWait(False)
  ScorpiusREF.moveto(ScorpiusOborumMarker, 0.0, 0.0, 0.0, True, False)
  ScorpiusREF.Enable(False)
  Alias_Hunter.GetActorRef().moveto(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_1000_Item_03()
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef()
  spaceshipreference HelixREF = Alias_EmissaryShip.GetShipRef()
  ScorpiusREF.DisableNoWait(False)
  HelixREF.DisableNoWait(False)
EndFunction
