ScriptName EnableOnDeath Extends Actor Const
{ When Parent Dying, enable property ref }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property ObjToEnable Auto Const
{ Set ref to be enabled }

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  ObjToEnable.Enable(False)
EndEvent
