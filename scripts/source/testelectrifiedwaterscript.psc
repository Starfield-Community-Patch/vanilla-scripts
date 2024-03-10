ScriptName TestElectrifiedWaterScript Extends ObjectReference

;-- Variables ---------------------------------------
Int instance1

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
VisualEffect Property ElectrifiedWaterEffect Auto Const mandatory
wwiseevent Property ElectrifiedWaterSound Auto Const
Bool Property bPowered = True Auto

;-- Functions ---------------------------------------

Event OnLoad()
  If bPowered
    ElectrifiedWaterEffect.Play(Self.GetLinkedRef(LinkCustom01), -1.0, None)
    instance1 = ElectrifiedWaterSound.Play(Self as ObjectReference, None, None)
  EndIf
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If bPowered
    ElectrifiedWaterEffect.Stop(Self.GetLinkedRef(LinkCustom01))
    Self.GetLinkedRef(LinkCustom01).Disable(False)
    wwiseevent.StopInstance(instance1)
    bPowered = False
  ElseIf bPowered == False
    Self.GetLinkedRef(LinkCustom01).Enable(False)
    Utility.Wait(0.5)
    ElectrifiedWaterEffect.Play(Game.GetPlayer() as ObjectReference, -1.0, None)
    instance1 = ElectrifiedWaterSound.Play(Self as ObjectReference, None, None)
    bPowered = True
  EndIf
EndEvent
