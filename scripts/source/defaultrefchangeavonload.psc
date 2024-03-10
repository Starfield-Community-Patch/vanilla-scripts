ScriptName DefaultRefChangeAVOnLoad Extends ObjectReference
{ Sets, mods, or damages one or more actor values on load, once only. }

;-- Structs -----------------------------------------
Struct ActorValueDatum
  ActorValue ActorValueToChange
  { An actor value to change. }
  Float NewValue
  { The amount to set this actor value to, mod the value by, or damage the value by. }
  Int TypeOfChange
  { DEFAULT=0. 0=Set, 1=Mod, 2=Damage, 3=Restore }
EndStruct


;-- Variables ---------------------------------------
Int CONST_TypeOfChange_Damage = 2 Const
Int CONST_TypeOfChange_Mod = 1 Const
Int CONST_TypeOfChange_Restore = 3 Const
Int CONST_TypeOfChange_Set = 0 Const

;-- Properties --------------------------------------
defaultrefchangeavonload:actorvaluedatum[] Property ActorValueData Auto Const mandatory
{ Struct of actor values to be changed. }

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnLoad()
    Self.GoToState("Done")
    Int I = 0
    While I < ActorValueData.Length
      defaultrefchangeavonload:actorvaluedatum current = ActorValueData[I]
      If current.TypeOfChange == CONST_TypeOfChange_Set
        Self.SetValue(current.ActorValueToChange, current.NewValue)
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Mod
        Self.ModValue(current.ActorValueToChange, current.NewValue)
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Damage
        Self.DamageValue(current.ActorValueToChange, current.NewValue)
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Restore
        Self.RestoreValue(current.ActorValueToChange, current.NewValue)
      EndIf
      I += 1
    EndWhile
  EndEvent
EndState
