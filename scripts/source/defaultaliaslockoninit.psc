ScriptName DefaultAliasLockOnInit Extends ReferenceAlias Const default
{ Default script used for checking if an alias has been locked/unlocked }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property LockLevel = -1 Auto Const
{ Optional: The Lock Level for the door. By default, the lock will be Very Easy }

;-- Functions ---------------------------------------

Event OnAliasInit()
  ObjectReference myRef = Self.GetRef()
  myRef.Lock(True, False, True)
  If LockLevel > 0
    myRef.SetLockLevel(LockLevel)
  EndIf
EndEvent
