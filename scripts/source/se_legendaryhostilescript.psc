ScriptName SE_LegendaryHostileScript Extends ReferenceAlias
{ Script to induce ships to attack based on distance }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Data
  ReferenceAlias Property TargetAlias Auto Const mandatory
  { The alias we're interested in }
  Int Property HailingDistance = 5000 Auto Const
  { The needed distance to start the hail }
  Int Property AttackDistance = 1500 Auto Const
  { The needed distance for the group to attack }
  Int Property ObjectiveToDisplay = 10 Auto Const
  { The objective for the player to attack }
  Scene Property HailingScene Auto Const
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property PlayerEnemyFaction Auto Const mandatory
  ReferenceAlias Property Alias_MapMarker Auto Const
  RefCollectionAlias Property LegendaryShips Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  Bool Property IsFlagship = False Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If IsFlagship == True
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, HailingDistance as Float, 0)
  Else
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, AttackDistance as Float, 0)
  EndIf
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  LegendaryShips.AddRef(Self.GetRef())
EndEvent

Event OnUnload()
  If IsFlagship == True
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, HailingDistance)
  Else
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, AttackDistance)
  EndIf
  Self.UnregisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
  (Self.GetOwningQuest() as se_legendaryscript).StartMoveTimer()
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If IsFlagship == True
    HailingScene.Start()
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, HailingDistance)
  Else
    Self.BeginAttack()
  EndIf
  Self.GetOwningQuest().SetObjectiveDisplayed(ObjectiveToDisplay, True, False)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.BeginAttack()
EndEvent

Function BeginAttack()
  LegendaryShips.RemoveFromFaction(PlayerFriendFaction)
  LegendaryShips.AddtoFaction(PlayerEnemyFaction)
  LegendaryShips.SetValue(Aggression, 1.0)
  LegendaryShips.StartCombatAll(Game.GetPlayer() as ObjectReference)
  If IsFlagship == False
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, AttackDistance)
  EndIf
  Self.UnregisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True)
EndFunction
