ScriptName SG02_SatelliteScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ShutdownStage Auto Const
{ If this stage is set, stop trying to destroy this object }
Bool Property DamageOnce = False Auto
{ Make sure we're only damaging this object the first time it loads in }

;-- Functions ---------------------------------------

Event OnLoad()
  If !DamageOnce && !Self.GetOwningQuest().GetStageDone(ShutdownStage)
    DamageOnce = True
    Self.GetRef().TryToSetEssential(True)
    Self.GetRef().DamageObject(1.799999952)
  EndIf
EndEvent

Function Fix()
  Self.GetRef().Repair()
EndFunction
