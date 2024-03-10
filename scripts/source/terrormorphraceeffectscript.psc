ScriptName TerrormorphRaceEffectScript Extends ActiveMagicEffect
{ make sure Terrormorphs flee when they enter combat with an Aceles }

;-- Variables ---------------------------------------
Float fUpdateTime = 1.0 Const
Int iUpdateTimerID = 1 Const

;-- Properties --------------------------------------
Faction Property AcelesFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnCombatListAdded")
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnCombatListRemoved")
  Self.UpdateAcelesFlee()
EndEvent

Event Actor.OnCombatListAdded(Actor akSource, Actor akTarget)
  If akTarget as Bool && akTarget.IsInFaction(AcelesFaction)
    Self.StartTimer(fUpdateTime, iUpdateTimerID)
  EndIf
EndEvent

Event Actor.OnCombatListRemoved(Actor akSource, Actor akTarget)
  If akTarget as Bool && akTarget.IsInFaction(AcelesFaction)
    Self.StartTimer(fUpdateTime, iUpdateTimerID)
  EndIf
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iUpdateTimerID
    Self.UpdateAcelesFlee()
  EndIf
EndEvent

Function UpdateAcelesFlee()
  Actor myCaster = Self.GetCasterActor()
  Actor[] myTargets = myCaster.GetAllCombatTargets()
  Actor foundAceles = None
  If myTargets.Length > 0
    Int I = 0
    While I < myTargets.Length && foundAceles == None
      Actor theTarget = myTargets[I]
      If theTarget.IsDead() == False && theTarget.IsInFaction(AcelesFaction)
        foundAceles = theTarget
      EndIf
      I += 1
    EndWhile
  EndIf
  If foundAceles
    myCaster.SetValue(Game.GetConfidenceAV(), 0.0)
  Else
    myCaster.SetValue(Game.GetConfidenceAV(), 4.0)
  EndIf
  myCaster.EvaluatePackage(False)
EndFunction
