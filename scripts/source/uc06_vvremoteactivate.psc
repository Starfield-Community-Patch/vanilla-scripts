ScriptName UC06_VVRemoteActivate Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VaeVictis Auto Const mandatory
{ Alias for Vae Victis NPC }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerAct = Game.GetPlayer()
  If akActionRef == PlayerAct as ObjectReference
    VaeVictis.GetRef().Activate(PlayerAct as ObjectReference, False)
  EndIf
EndEvent
