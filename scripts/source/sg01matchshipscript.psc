ScriptName SG01MatchShipScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
ActorValue Property ShipSystem Auto Const
ActorValue Property EngineSystemHealth Auto Const mandatory
ActorValue Property WeaponGroup1SystemHealth Auto Const mandatory
ActorValue Property WeaponGroup2SystemHealth Auto Const mandatory
ActorValue Property WeaponGroup3SystemHealth Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property Invulnerable Auto Const mandatory
Quest Property SG01 Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
GlobalVariable Property SG01_CompetitorsRemaining Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If abRemove == False
    (akObject as spaceshipreference).EnablePartRepair(EngineSystemHealth, False)
  EndIf
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterForHitEvent(akSenderRef as ScriptObject, None, None, None, -1, -1, -1, -1, True)
  Int I = 0
  While I < Self.GetCount()
    ObjectReference theRef = Self.GetAt(I)
    theRef.SetValue(DockingPermission, 4.0)
    I += 1
  EndWhile
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If !SG01.GetStageDone(700)
    If akAggressor == Game.GetPlayer() as ObjectReference
      SG01.SetStage(525)
      If SG01.GetStageDone(530)
        SG01.SetStage(550)
      Else
        Self.RegisterForHitEvent(akTarget as ScriptObject, None, None, None, -1, -1, -1, -1, True)
      EndIf
    EndIf
  EndIf
EndEvent

Event OnShipSystemDamaged(ObjectReference akSenderRef, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If akSystem == ShipSystem && aFullyDamaged
    akSenderRef.SetValue(Aggression, 0.0)
    Int nCompetitorsLeft = 0
    Int I = 0
    While I < Self.GetCount()
      ObjectReference theRef = Self.GetAt(I)
      If theRef.GetValue(Aggression) == 2.0
        nCompetitorsLeft += 1
      EndIf
      I += 1
    EndWhile
    If !SG01.GetStageDone(600)
      nCompetitorsLeft = Self.GetCount()
    EndIf
    If nCompetitorsLeft == 0
      SG01.SetStage(800)
    EndIf
    If nCompetitorsLeft <= 2
      SG01.SetStage(720)
    EndIf
    spaceshipreference spaceshipRef = akSenderRef as spaceshipreference
    spaceshipRef.EnablePartRepair(None, False)
    spaceshipRef.DamageValue(WeaponGroup1SystemHealth, 10000.0)
    spaceshipRef.DamageValue(WeaponGroup2SystemHealth, 10000.0)
    spaceshipRef.DamageValue(WeaponGroup3SystemHealth, 10000.0)
    spaceshipRef.StopCombat()
    spaceshipRef.SetUnconscious(True)
    spaceshipRef.RemoveFromFaction(PlayerEnemyFaction)
    spaceshipRef.AddToFaction(CaptiveFaction)
    spaceshipRef.AddToFaction(PlayerFriendFaction)
    spaceshipRef.IgnoreFriendlyHits(True)
    spaceshipRef.SetValue(Invulnerable, 1.0)
    spaceshipRef.EvaluatePackage(True)
    spaceshipRef.StopCombat()
    SG01_CompetitorsRemaining.SetValue(nCompetitorsLeft as Float)
    SG01.UpdateCurrentInstanceGlobal(SG01_CompetitorsRemaining)
    SG01.SetObjectiveDisplayed(700, True, True)
  EndIf
EndEvent
