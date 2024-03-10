ScriptName POI004_SwapCreatureScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool swapActivated = False

;-- Properties --------------------------------------
Keyword Property POI004_MoltingShellKeyword Auto Const
Keyword Property POI004_HiddenCreatureKeyword Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && !swapActivated
    ObjectReference moltingShell = Self.GetLinkedRef(POI004_MoltingShellKeyword)
    ObjectReference hiddenCreature = Self.GetLinkedRef(POI004_HiddenCreatureKeyword)
    moltingShell.Disable(False)
    hiddenCreature.Enable(False)
    swapActivated = True
  EndIf
EndEvent
