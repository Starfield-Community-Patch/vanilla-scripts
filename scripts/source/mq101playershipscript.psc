ScriptName MQ101PlayerShipScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TheLodge Auto mandatory
Location Property SNarionA_PAnselon_MKreet Auto mandatory
Location Property KreetWorldSpaceLocation Auto mandatory
Location Property NewAtlantisLocation Auto mandatory
Location Property SAlphaCentauri_PJemison_Orbit Auto mandatory
Location Property SNarionA_PAnselon_MKreet_Orbit Auto Const mandatory
ActorValue Property SpaceshipBuildableEnginePower Auto Const mandatory
ActorValue Property SpaceshipBuildableThrusterPower Auto Const mandatory
ActorValue Property SpaceshipBuildableShieldPower Auto Const mandatory
ActorValue Property SpaceshipGravJumpPower Auto Const mandatory
ActorValue Property SpaceshipWeaponGatlingGunPower Auto Const mandatory
ActorValue Property SpaceshipWeaponGunPower Auto Const mandatory
ActorValue Property SpaceshipWeaponMissileLauncherPower Auto Const mandatory

;-- Functions ---------------------------------------

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If abComplete && (akParent as ObjectReference == TheLodge.GetRef())
    Self.GetOwningQuest().SetStage(1500)
  EndIf
EndEvent

Event OnShipLanding(Bool abComplete)
  Quest MyQuest = Self.GetOwningQuest()
  ObjectReference MyShip = Self.GetRef()
  Location MyLocation = MyShip.GetCurrentLocation()
  If MyShip.IsInLocation(SNarionA_PAnselon_MKreet) || MyShip.IsInLocation(KreetWorldSpaceLocation)
    If abComplete == False
      MyQuest.SetStage(610)
    Else
      MyQuest.SetStage(615)
    EndIf
  ElseIf MyShip.IsInLocation(NewAtlantisLocation)
    If abComplete == False
      MyQuest.SetStage(1305)
    Else
      MyQuest.SetStage(1310)
    EndIf
  EndIf
EndEvent

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  Quest MyQuest = Self.GetOwningQuest()
  If MyQuest.GetStageDone(419) && MyQuest.GetStageDone(485) == False
    Self.CheckPowerToSystems()
  EndIf
EndEvent

Function CheckPowerToSystems()
  Quest MyQuest = Self.GetOwningQuest()
  ObjectReference myShipRef = Self.GetRef()
  Float EnginePower = myShipRef.GetValue(SpaceshipBuildableEnginePower)
  Float ShieldPower = myShipRef.GetValue(SpaceshipBuildableShieldPower)
  Float GatlingPower = myShipRef.GetValue(SpaceshipWeaponGatlingGunPower)
  Float GunPower = myShipRef.GetValue(SpaceshipWeaponGunPower)
  Float MissilePower = myShipRef.GetValue(SpaceshipWeaponMissileLauncherPower)
  Float GravJumpPower = myShipRef.GetValue(SpaceshipGravJumpPower)
  ObjectReference myPlayerShip = Game.GetPlayer().GetSpaceShip() as ObjectReference
  If myPlayerShip
    If GravJumpPower > 0.0 && EnginePower > 0.0 && ShieldPower > 0.0 && (GatlingPower > 0.0 || GunPower > 0.0 || MissilePower > 0.0)
      If MyQuest.GetStageDone(420) == True && MyQuest.GetStageDone(424) == False && MyQuest.GetStageDone(485) == False
        MyQuest.SetStage(485)
      EndIf
    EndIf
  EndIf
EndFunction

Event OnShipTakeOff(Bool abComplete)
  Quest MyQuest = Self.GetOwningQuest()
  If abComplete == True
    If MyQuest.GetStageDone(340) == True
      MyQuest.SetStage(400)
    EndIf
  EndIf
EndEvent
