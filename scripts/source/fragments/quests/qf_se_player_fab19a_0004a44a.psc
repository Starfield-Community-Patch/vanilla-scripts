ScriptName Fragments:Quests:QF_SE_Player_FAB19a_0004A44A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_Player_FAB19a_100_JunoBarks Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Juno Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker03 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_GeneralMarker03.GetRef()
  spaceshipreference oJuno = Alias_Juno.GetRef() as spaceshipreference
  oJuno.Enable(False)
  oJuno.MoveTo(oTarg, 0.0, 0.0, 0.0, True, False)
  oJuno.SetValue(Aggression, 3.0)
  oJuno.StartCombat(Alias_playerShip.GetRef() as spaceshipreference, False)
  oJuno.SetValue(DockingPermission, 4.0)
  Alias_Juno.GetShipRef().SetGhost(False)
  Alias_Juno.GetShipRef().IsEssential(False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(5.0)
  SE_Player_FAB19a_100_JunoBarks.Start()
EndFunction
