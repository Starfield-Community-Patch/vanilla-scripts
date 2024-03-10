ScriptName Fragments:Quests:QF_SE_Player_FAB18c_00042C53 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_GenghisKhan Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
spaceshipbase Property GenghisBaseShip Auto Const
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
Scene Property SE_FAB18c_100_SpawnLine Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  spaceshipreference sShip = None
  spaceshipreference sPlayer = Alias_PlayerShip.GetRef() as spaceshipreference
  sShip = sPlayer.PlaceShipAtMeOffset(GenghisBaseShip as Form, 50.0, 750.0, 0.0, 4, True, False, True, True, Alias_GenghisKhan as Alias, None, True)
  sShip.EnableWithGravJumpNoWait()
  sShip.SetValue(DockingPermission, 4.0)
  Utility.Wait(10.0)
  Self.SetStage(100)
EndFunction

Function Fragment_Stage_0100_Item_00()
  SE_FAB18c_100_SpawnLine.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference sGenghis = Alias_GenghisKhan.GetRef() as spaceshipreference
  spaceshipreference sPlayer = Alias_PlayerShip.GetRef() as spaceshipreference
  sGenghis.RemoveFromAllFactions()
  sGenghis.SetValue(Aggression, 3.0)
  sGenghis.StartCombat(sPlayer, False)
  sGenghis.EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  MS02_GenghisReactivity.SetValue(0.0)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
