ScriptName TestE3VideoQuestScript Extends Quest

;-- Variables ---------------------------------------
ObjectReference custom05Ref

;-- Properties --------------------------------------
ObjectReference Property TestE3Custom05MarkerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function SpawnCustom05(ActorBase actorToSpawn)
  If custom05Ref != None
    custom05Ref.Disable(False)
    custom05Ref.Delete()
  EndIf
  custom05Ref = TestE3Custom05MarkerRef.PlaceActorAtMe(actorToSpawn, 4, None, False, True, True, None, True) as ObjectReference
  custom05Ref.SetLinkedRef(TestE3Custom05MarkerRef, None, True)
  custom05Ref.SetValue(Game.GetAggressionAV(), 0.0)
  custom05Ref.Enable(False)
EndFunction
