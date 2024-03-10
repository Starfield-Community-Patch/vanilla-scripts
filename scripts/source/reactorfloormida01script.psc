ScriptName ReactorFloorMidA01Script Extends ObjectReference
{ Script for the ReactorFloorMidA01 object. }

;-- Variables ---------------------------------------
String CONST_Animation_Active = "Play02" Const
String CONST_Animation_Inactive = "Play01" Const
Int CONST_DestroyedStateDamage = 1000 Const
Int CONST_ReactorState_Active = 0 Const
Int CONST_ReactorState_Destroyed = 2 Const
Int CONST_ReactorState_Inactive = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard ReactorStateGuard

;-- Properties --------------------------------------
Int Property ReactorState = 0 Auto
{ DEFAULT=0. The state of the Reactor. 0=Active, 1=Inactive, 2=Destroyed. }

;-- Functions ---------------------------------------

Event OnCellLoad()
  Guard ReactorStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    Self.SetReactorState(ReactorState, True)
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndEvent

Function SetReactorState(Int newState, Bool forceUpdate)
  Guard ReactorStateGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard 
    If forceUpdate || newState != ReactorState
      ReactorState = newState
      If ReactorState == CONST_ReactorState_Active
        Self.ClearDestruction()
        If Self.Is3DLoaded()
          Self.PlayAnimation(CONST_Animation_Active)
        EndIf
      ElseIf ReactorState == CONST_ReactorState_Inactive
        Self.ClearDestruction()
        If Self.Is3DLoaded()
          Self.PlayAnimation(CONST_Animation_Inactive)
        EndIf
      ElseIf ReactorState == CONST_ReactorState_Destroyed
        If Self.Is3DLoaded()
          Self.DamageObject(CONST_DestroyedStateDamage as Float)
        EndIf
      EndIf
    EndIf
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard 
EndFunction
