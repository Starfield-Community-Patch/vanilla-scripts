ScriptName Fragments:Scenes:SF_MQ305_000_GravJumpUnity_0005490F Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property PlayerShip Auto Const
VisualEffect Property ShipGravJumpSpaceVFX Auto Const mandatory
MusicType Property MUSGenesisStingerGravJumpUnity Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  Game.GetPlayer().StopCombatAlarm()
  PlayerShip.GetShipRef().SetGhost(True)
  ShipGravJumpSpaceVFX.Play(PlayerShip.GetRef(), -1.0, None)
  MUSGenesisStingerGravJumpUnity.Add()
  Game.HideHudMenus()
EndFunction

Function Fragment_End()
  mq305script kmyQuest = Self.GetOwningQuest() as mq305script
  PlayerShip.GetShipRef().SetGhost(False)
  kmyQuest.GravJumpToUnity()
  ShipGravJumpSpaceVFX.Stop(PlayerShip.GetRef())
EndFunction
