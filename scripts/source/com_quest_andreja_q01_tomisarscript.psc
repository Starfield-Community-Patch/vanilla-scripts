ScriptName COM_Quest_Andreja_Q01_TomisarScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Andreja Auto Const
Quest Property COM_Quest_Andreja_Q01 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, Alias_Andreja.GetRef() as ScriptObject, None, None, -1, -1, -1, -1, True)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor == Alias_Andreja.GetActorRef() as ObjectReference
    (akTarget as Actor).Kill(None)
    COM_Quest_Andreja_Q01.SetStage(395)
  Else
    Self.RegisterForHitEvent(Self as ScriptObject, Alias_Andreja.GetRef() as ScriptObject, None, None, -1, -1, -1, -1, True)
  EndIf
EndEvent

Event OnDeath(ObjectReference AkKiller)
  If COM_Quest_Andreja_Q01.GetStageDone(395) == False
    If COM_Quest_Andreja_Q01.GetStageDone(375) == False
      COM_Quest_Andreja_Q01.SetStage(399)
    EndIf
  EndIf
  COM_Quest_Andreja_Q01.SetStage(400)
EndEvent
