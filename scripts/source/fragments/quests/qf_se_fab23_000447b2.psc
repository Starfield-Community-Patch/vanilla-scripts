ScriptName Fragments:Quests:QF_SE_FAB23_000447B2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
spaceshipbase Property EncShip_Spacer_F01 Auto Const
spaceshipbase Property EncShip_Spacer_M01 Auto Const
RefCollectionAlias Property Alias_SpacerBaddies Auto Const mandatory
Scene Property SE_FAB23_100_IntroBark Auto Const mandatory
Scene Property SE_FAB23_200_HostilesDown Auto Const mandatory
ReferenceAlias Property Alias_NiaKalu Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef()
  spaceshipreference sShip = None
  spaceshipreference sNia = Alias_NiaKalu.GetRef() as spaceshipreference
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference
  spaceshipbase sBadGuy = EncShip_Spacer_M01
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True)
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference)
  sShip.SetValue(Aggression, 3.0)
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, -500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True)
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference)
  sShip.SetValue(Aggression, 3.0)
  sBadGuy = EncShip_Spacer_F01
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 0.0, 500.0, 0.0, 4, True, False, False, True, None, None, True)
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference)
  sShip.SetValue(Aggression, 3.0)
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 0.0, -500.0, 0.0, 4, True, False, False, True, None, None, True)
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference)
  sShip.SetValue(Aggression, 3.0)
  Alias_SpacerBaddies.StartCombatAll(sNia as ObjectReference)
  Alias_SpacerBaddies.StartCombatAll(sPlayer as ObjectReference)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(3.0)
  SE_FAB23_100_IntroBark.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  SE_FAB23_200_HostilesDown.Start()
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(4.0)
  spaceshipreference sShip = Alias_NiaKalu.GetRef() as spaceshipreference
  sShip.DisableWithGravJumpNoWait()
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
