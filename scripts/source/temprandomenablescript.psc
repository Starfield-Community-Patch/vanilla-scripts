ScriptName TempRandomEnableScript Extends ObjectReference Const
{ until we have this hooked up in code on LChars }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property MinToEnable = 0 Auto Const
{ always enable at least this many }

;-- Functions ---------------------------------------

Event OnInit()
  ObjectReference[] myChildren = Self.GetRefsLinkedToMe(None, None)
  Int roll = Math.Max(MinToEnable as Float, Utility.RandomInt(0, myChildren.Length) as Float) as Int
  Int I = 0
  While I < roll
    ObjectReference theChild = myChildren[I]
    theChild.Enable(False)
    I += 1
  EndWhile
EndEvent
