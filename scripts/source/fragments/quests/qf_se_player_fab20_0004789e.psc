ScriptName Fragments:Quests:QF_SE_Player_FAB20_0004789E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
RefCollectionAlias Property Alias_MathisAllies Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
Form Property EncShip_CrimsonFleet_F Auto Const
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker03 Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker01 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
GlobalVariable Property SE_Player_FAB20_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oMarker = Alias_GeneralMarker01.GetRef()
  spaceshipreference sShip = None
  Float[] offset = new Float[6]
  offset[0] = 221.0
  offset[1] = -333.0
  offset[2] = 0.0
  offset[5] = 23.0
  sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, 4, True, False, False, True, offset, None, None, True)
  Alias_MathisAllies.AddRef(sShip as ObjectReference)
  offset[0] = -100.0
  sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, 4, True, False, False, True, offset, None, None, True)
  Alias_MathisAllies.AddRef(sShip as ObjectReference)
  offset[1] = -200.0
  sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, 4, True, False, False, True, offset, None, None, True)
  Alias_MathisAllies.AddRef(sShip as ObjectReference)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Utility.wait(6.0)
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference sShip = Alias_HailingShip.GetRef() as spaceshipreference
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference
  sShip.RemoveFromFaction(PlayerFriendFaction)
  sShip.AddToFaction(PlayerEnemyFaction)
  sShip.SetValue(Aggression, 1.0)
  sShip.StartCombat(sPlayer, False)
  Int I = 0
  Int iCount = Alias_MathisAllies.GetCount()
  While I < iCount
    sShip = Alias_MathisAllies.GetShipAt(I)
    If sShip
      sShip.RemoveFromFaction(PlayerFriendFaction)
      sShip.AddToFaction(PlayerEnemyFaction)
      sShip.SetValue(Aggression, 1.0)
      sShip.StartCombat(sPlayer, False)
    EndIf
    I += 1
  EndWhile
EndFunction

Function Fragment_Stage_1000_Item_00()
  SE_Player_FAB20_RunOnce.SetValue(1.0)
EndFunction
