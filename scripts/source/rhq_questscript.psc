ScriptName RHQ_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property MaxStaggerTime = 0.5 Auto Const
{ Max amount of time between staggered NPCs }

;-- Functions ---------------------------------------

Function StaggerEVP(RefCollectionAlias akTargetColl)
  Int I = akTargetColl.GetCount() - 1
  While I >= 0
    Actor currAct = akTargetColl.GetAt(I) as Actor
    If currAct != None && !currAct.IsDead() && currAct.IsEnabled()
      Utility.Wait(Utility.RandomFloat(0.0, MaxStaggerTime))
      currAct.EvaluatePackage(False)
    EndIf
    akTargetColl.RemoveRef(currAct as ObjectReference)
    I -= 1
  EndWhile
EndFunction
