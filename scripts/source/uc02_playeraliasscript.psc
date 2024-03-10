ScriptName UC02_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Terrormorph Auto Const mandatory
{ Ref alias for the Terrormorph }
Int Property StageToSet = 550 Auto Const
{ Stage to set when the player gains LOS with the Terrormorph }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForDirectLOSGain(Self.GetRef(), Terrormorph.GetRef(), "", "")
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
  If akViewer == Self.GetRef() && akTarget == Terrormorph.GetRef()
    Self.UnregisterForLOS(Self.GetRef(), Terrormorph.GetRef())
    Self.GetOwningQuest().SetStage(StageToSet)
  EndIf
EndEvent
