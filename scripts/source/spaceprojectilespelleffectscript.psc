ScriptName SpaceProjectileSpellEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Int CONST_RandomSeedMax = 100000 Const
Int CONST_RandomSeedMin = -100000 Const
ObjectReference hazardTarget
ObjectReference[] hitProjectileSources

;-- Properties --------------------------------------
Group HitProjectile
  Float Property CONST_HitProjectile_SpawnDelayMin = 1.0 Auto Const
  Float Property CONST_HitProjectile_SpawnDelayMax = 1.0 Auto Const
  Int Property CONST_HitProjectile_SpawnDistanceMin = 200 Auto Const
  Int Property CONST_HitProjectile_SpawnDistanceMax = 500 Auto Const
  Float Property CONST_HitProjectile_ForwardArcChanceForPlayer = 1.0 Auto Const
  Int Property CONST_HitProjectile_ForwardArcDegrees = 20 Auto Const
  Int Property CONST_HitProjectileSourcesCount = 10 Auto Const
EndGroup

Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
Spell Property Debug_SpaceProjectileSpell Auto Const mandatory
Activator Property ProjectileSourceMarker01 Auto Const mandatory
Static Property XMarkerHeading Auto Const mandatory
ActorValue Property DebugHazardValue Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  hazardTarget = akTarget
  hitProjectileSources = new ObjectReference[CONST_HitProjectileSourcesCount]
  Self.RegisterForRemoteEvent((akTarget as spaceshipreference) as ScriptObject, "OnLocationChange")
  Self.StartTimer(0.0, 0)
EndEvent

Event SpaceshipReference.OnLocationChange(spaceshipreference akSource, Location akOldLoc, Location akNewLoc)
  hazardTarget.RestoreValue(DebugHazardValue, 10000.0)
  hazardTarget.DispelSpell(Debug_SpaceProjectileSpell)
EndEvent

Event OnTimer(Int timerID)
  Float currentHazardValue = hazardTarget.GetValue(DebugHazardValue)
  If currentHazardValue < 0.0
    hazardTarget.RestoreValue(DebugHazardValue, 10000.0)
    ObjectReference sourceToDelete = hitProjectileSources[0]
    If sourceToDelete != None
      sourceToDelete.Delete()
    EndIf
    hitProjectileSources.remove(0, 1)
    Float[] offsets = new Float[6]
    offsets[0] = 0.0
    offsets[1] = Utility.RandomFloat(CONST_HitProjectile_SpawnDistanceMin as Float, CONST_HitProjectile_SpawnDistanceMax as Float)
    offsets[2] = 0.0
    ObjectReference projectileSource = hazardTarget.PlaceAtMe(ProjectileSourceMarker01 as Form, 1, False, False, True, offsets, None, True)
    LC088_DefensiveBatteryFireProjectileSpell.Cast(projectileSource, hazardTarget)
    hitProjectileSources.add(projectileSource, 1)
    Self.StartTimer(Utility.RandomFloat(CONST_HitProjectile_SpawnDelayMin, CONST_HitProjectile_SpawnDelayMax), 0)
  Else
    hazardTarget.DispelSpell(Debug_SpaceProjectileSpell)
  EndIf
EndEvent
