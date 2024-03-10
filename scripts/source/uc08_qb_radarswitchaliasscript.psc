ScriptName UC08_QB_RadarSwitchAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 160 Auto Const
{ Don't trigger this behavior unless this stage is set }
Int Property ShutdownStage = 900 Auto Const
{ If this stage has been set, the Queen's down and we don't need to do any more with this }
RefCollectionAlias Property SupportCollection Auto Const mandatory
{ The collection holding the support creatures spawned in by this switch }
RefCollectionAlias Property SupportMorphCollection Auto Const mandatory
{ The collection of morphs associated with this switch }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  uc08_queenbattle_questscript OQ = Self.GetOwningQuest() as uc08_queenbattle_questscript
  If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage)
    Self.Clear()
    ObjectReference BroadcastREF = Self.GetRef().GetLinkedRef(None)
    OQ.TriggerRadarBlast(BroadcastREF, SupportMorphCollection, SupportCollection)
  EndIf
EndEvent
