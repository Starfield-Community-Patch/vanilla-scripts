ScriptName RedMileRaceFanfareScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property Speed Auto
RefCollectionAlias Property Alias_LightRotationHelpers Auto Const mandatory

;-- Functions ---------------------------------------

Function StopFanfare()
  ; Empty function
EndFunction

Function StartDoorOpenFanfare()
  Int I = 0
  ObjectReference[] LightRotationHelpers = None
  LightRotationHelpers = Alias_LightRotationHelpers.GetArray()
  While I < LightRotationHelpers.Length
    LightRotationHelpers[I].SetAnimationVariableFloat("Speed", Speed)
    LightRotationHelpers[I].PlayAnimation("RotateCW_Loop")
    I += 1
  EndWhile
EndFunction
