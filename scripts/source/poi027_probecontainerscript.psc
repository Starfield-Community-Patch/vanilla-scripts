ScriptName POI027_ProbeContainerScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property POI027_ProbeFireEffectsKeyword Auto Const
Keyword Property POI027_WaterEffectsKeyword Auto Const
Keyword Property POI027_CreaturesKeyword Auto Const
Keyword Property LinkCustom01 Auto Const
Faction Property POI027_AngryCreatureFaction Auto Const
ActorValue Property Aggression Auto Const
ActorValue Property POI027_ProbeEngineActive Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(None)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ObjectReference[] probeFireEffects = Self.GetRefsLinkedToMe(POI027_ProbeFireEffectsKeyword, None)
  Int iProbeFireEffect = 0
  While iProbeFireEffect < probeFireEffects.Length
    ObjectReference probeFireEffect = probeFireEffects[iProbeFireEffect]
    probeFireEffect.Disable(False)
    iProbeFireEffect += 1
  EndWhile
  ObjectReference[] waterEffects = Self.GetRefsLinkedToMe(POI027_WaterEffectsKeyword, None)
  Int iWaterEffect = 0
  While iWaterEffect < waterEffects.Length
    ObjectReference waterEffect = waterEffects[iWaterEffect]
    waterEffect.Disable(False)
    iWaterEffect += 1
  EndWhile
  ObjectReference[] creatures = Self.GetRefsLinkedToMe(POI027_CreaturesKeyword, None)
  Actor player = Game.GetPlayer()
  Int iCreature = 0
  While iCreature < creatures.Length
    Actor creature = creatures[iCreature] as Actor
    creature.SetFactionOwner(POI027_AngryCreatureFaction, False)
    creature.SetLinkedRef(player as ObjectReference, LinkCustom01, True)
    creature.SetValue(POI027_ProbeEngineActive, 0.0)
    creature.SetValue(Aggression, 2.0)
    creature.EvaluatePackage(False)
    iCreature += 1
  EndWhile
EndEvent
