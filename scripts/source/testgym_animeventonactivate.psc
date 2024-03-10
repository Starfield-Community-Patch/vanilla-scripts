ScriptName TestGym_AnimEventOnActivate Extends ObjectReference Const
{ Tests brads stuff }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PipeArt Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If 1 > 0
    PipeArt.PlayAnimation("Play01")
    Utility.Wait(3.0)
    PipeArt.PlayAnimation("StopEffect")
  EndIf
EndEvent
