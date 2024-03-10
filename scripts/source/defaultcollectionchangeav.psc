ScriptName DefaultCollectionChangeAV Extends RefCollectionAlias default
{ Sets, mods, or damages one or more actor values when references are added to this collection. }

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
defaultcollectionchangeav:actorvaluedatum[] Property ActorValueData Auto Const mandatory
{ Struct of actor values to be changed. }

;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If !abRemove
    Int I = 0
    While I < ActorValueData.Length
      defaultcollectionchangeav:actorvaluedatum current = ActorValueData[I]
      If current.TypeOfChange == CONST_TypeOfChange_Set
        akObject.SetValue(current.ActorValueToChange, current.NewValue)
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Mod
        akObject.ModValue(current.ActorValueToChange, current.NewValue)
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Damage
        akObject.DamageValue(current.ActorValueToChange, current.NewValue)
      ElseIf current.TypeOfChange == CONST_TypeOfChange_Restore
        akObject.RestoreValue(current.ActorValueToChange, current.NewValue)
      EndIf
      I += 1
    EndWhile
  EndIf
EndEvent
