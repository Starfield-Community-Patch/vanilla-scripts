ScriptName Fragments:Quests:QF_SE_Player_FAB18b_000447B4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property SE_FAB18b_200_PostCombatBark Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
spaceshipbase Property SmugglerBase Auto Const
RefCollectionAlias Property Alias_Smugglers Auto Const mandatory
ReferenceAlias Property Alias_SmugglerLeader Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef()
  spaceshipreference sShip = None
  spaceshipreference sGenghis = Alias_HailingShip.GetRef() as spaceshipreference
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference
  spaceshipbase sBadGuy = SmugglerBase
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True)
  sShip.RemoveFromAllFactions()
  sShip.SetValue(Aggression, 3.0)
  sShip.StartCombat(sGenghis, False)
  sShip.StartCombat(sPlayer, False)
  Alias_SmugglerLeader.ForceRefTo(sShip as ObjectReference)
  Alias_Smugglers.AddRef(sShip as ObjectReference)
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, -500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True)
  sShip.RemoveFromAllFactions()
  sShip.SetValue(Aggression, 3.0)
  sShip.StartCombat(sGenghis, False)
  sShip.StartCombat(sPlayer, False)
  Alias_Smugglers.AddRef(sShip as ObjectReference)
  Alias_Smugglers.StartCombatAll(sGenghis as ObjectReference)
  Alias_Smugglers.StartCombatAll(sPlayer as ObjectReference)
EndFunction

Function Fragment_Stage_0025_Item_00()
  spaceshipreference sGenghis = Alias_HailingShip.GetRef() as spaceshipreference
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference
  Alias_Smugglers.SetValue(Aggression, 3.0)
  Alias_Smugglers.StartCombatAll(sGenghis as ObjectReference)
  Alias_Smugglers.StartCombatAll(sPlayer as ObjectReference)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Utility.Wait(5.0)
  HailTemplate_100a_Hailing.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  SE_FAB18b_200_PostCombatBark.Start()
  MS02_GenghisReactivity.SetValue(3.0)
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference
  oTarg.DisableWithGravJump()
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference sShip = Alias_HailingShip.GetRef() as spaceshipreference
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference
  sShip.RemoveFromAllFactions()
  sShip.StartCombat(sPlayer, False)
  MS02_GenghisReactivity.SetValue(0.0)
EndFunction
