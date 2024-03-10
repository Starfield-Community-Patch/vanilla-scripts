ScriptName UC08_SupplyCacheCollTriggerScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property AccessCachesObjIndex = 335 Auto Const
{ Objective index for the "Access the supply caches" objective. We'll turn that off when the player has no
unexplored caches }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference
    Self.RemoveRef(akSenderRef)
    If Self.GetCount() <= 0
      Self.GetOwningQuest().SetObjectiveDisplayed(AccessCachesObjIndex, False, False)
    EndIf
  EndIf
EndEvent
