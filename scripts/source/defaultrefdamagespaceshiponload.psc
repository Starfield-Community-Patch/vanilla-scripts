ScriptName DefaultRefDamageSpaceshipOnLoad Extends SpaceshipReference
{ Damages a spaceship on load. Damage can be done to the ship's crew, parts, or other actor values. }

;-- Structs -----------------------------------------
Struct ActorValueDatum
  ActorValue ActorValueToDamage
  { An actor value to damage. }
  Float DamagePercent = 1.0
  { The percent to damage the value by, 0-1, with 1 being 100% damage. }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group DamageProperties
  Bool Property ShouldBeDestroyed = False Auto Const
  { DEFAULT=False. If True, the ship will be killed and break apart on load. All other settings will be ignored. }
  Bool Property ShouldBeDerelict = True Auto Const
  { DEFAULT=True. If True, the ship's SpaceshipCrew actor value will be reduced to 0, and the BEDerelict keyword will be added to the ship. }
  Bool Property ShouldApplyDerelictName = True Auto Const
  { DEFAULT=True. If True, prepend 'Derelict' to the ship's name. }
  Bool Property ShouldDamageRandomSystems = True Auto Const
  { DEFAULT=True. If True, ship systems will be damaged semi-randomly. If False, nothing will be done to the ship automatically. }
  Bool Property ShouldDisableExteriorLights = True Auto Const
  { DEFAULT=True. If True, the ship's exterior lights, if any, will be disabled. }
  Bool Property ShouldBlockRepairOfDestroyedParts = True Auto Const
  { DEFAULT=True. If True, EnablePartRepair will be used to block repair of the destroyed parts. }
  sq_parentscript:actorvaluedatum[] Property AdditionalActorValuesToDamage Auto Const
  { OPTIONAL. A list of additional actor values to damage. }
EndGroup

Group AutofillProperties
  sq_parentscript Property SQ_Parent Auto Const mandatory
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    Self.GoToState("Done")
    SQ_Parent.SetupDamagedShip(Self as SpaceshipReference, ShouldBeDestroyed, ShouldBeDerelict, ShouldApplyDerelictName, ShouldDamageRandomSystems, ShouldDisableExteriorLights, ShouldBlockRepairOfDestroyedParts, AdditionalActorValuesToDamage)
  EndEvent
EndState
