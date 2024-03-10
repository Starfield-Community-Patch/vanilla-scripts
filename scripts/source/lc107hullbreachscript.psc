ScriptName LC107HullBreachScript Extends ObjectReference
{ Script for the Hull Breach Packins in LC107. }

;-- Variables ---------------------------------------
Int CONST_DamageObjectHealth = 1 Const

;-- Properties --------------------------------------
Group AutofillProperties collapsedonref
  lc107questscript Property LC107 Auto Const mandatory
  GlobalVariable Property LC107VaultInstantBreachesCurrentGlobal Auto Const mandatory
  Keyword Property LC107_LinkHullBreach Auto Const mandatory
  Keyword Property LinkCustom01 Auto Const mandatory
  Keyword Property LinkCustom02 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function InitHullBreach()
  Self.GoToState("WaitingForBreach")
  ObjectReference hullBreach = Self.GetLinkedRef(LC107_LinkHullBreach)
  hullBreach.EnableNoWait(False)
  hullBreach.DamageObject(CONST_DamageObjectHealth as Float)
EndFunction

Function TriggerBreach(Bool isQuestWaitingOnBreach)
  If isQuestWaitingOnBreach
    LC107VaultInstantBreachesCurrentGlobal.Mod(1.0)
  EndIf
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
State WaitingForBreach

  Function TriggerBreach(Bool isQuestWaitingOnBreach)
    Self.GoToState("Done")
    ObjectReference[] myLinkedRefs = Self.GetRefsLinkedToMe(None, None)
    lc107hullbreachexplosionsourcescript myExplosionSource = None
    Int I = 0
    While I < myLinkedRefs.Length && myExplosionSource == None
      myExplosionSource = myLinkedRefs[I] as lc107hullbreachexplosionsourcescript
      If myExplosionSource != None
        myLinkedRefs.remove(I, 1)
      EndIf
      I += 1
    EndWhile
    If myExplosionSource != None
      myExplosionSource.TriggerBreach()
    EndIf
    ObjectReference myBreach = Self.GetLinkedRef(LC107_LinkHullBreach)
    myBreach.DamageObject(CONST_DamageObjectHealth as Float)
    ObjectReference myVFX = Self.GetLinkedRef(LinkCustom01)
    myVFX.EnableNoWait(False)
    ObjectReference myHazard = Self.GetLinkedRef(LinkCustom02)
    myHazard.EnableNoWait(False)
    If isQuestWaitingOnBreach
      LC107VaultInstantBreachesCurrentGlobal.Mod(1.0)
    EndIf
    I = 0
    While I < myLinkedRefs.Length
      If myLinkedRefs[I] != None
        If myLinkedRefs[I] as lc107hullbreachexplosionsourcescript != None
          (myLinkedRefs[I] as lc107hullbreachexplosionsourcescript).TriggerBreach()
        ElseIf myLinkedRefs[I] as trappipespray != None
          (myLinkedRefs[I] as trappipespray).BreakPipe()
        Else
          myLinkedRefs[I].EnableNoWait(False)
        EndIf
      EndIf
      I += 1
    EndWhile
  EndFunction
EndState

;-- State -------------------------------------------
Auto State WaitingForInit

  Function InitHullBreach()
    Self.GoToState("WaitingForBreach")
    ObjectReference hullBreach = Self.GetLinkedRef(LC107_LinkHullBreach)
    hullBreach.Enable(False)
    hullBreach.DamageObject(CONST_DamageObjectHealth as Float)
  EndFunction
EndState
