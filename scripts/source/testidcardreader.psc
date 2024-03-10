ScriptName TestIDCardReader Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
conditionform Property ConditionFormToTest Auto Const
{ If set, this condition form must be true for script to excecute it's functionality }
Bool Property AutoOpen Auto Const mandatory
{ If true, linked reference will recieve SetOpen }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If ConditionFormToTest.IsTrue(akActionRef, None)
    ObjectReference[] LinkedRefs = Self.GetLinkedRefChain(None, 100)
    Int I = 0
    While I < LinkedRefs.Length
      LinkedRefs[I].Lock(False, False, True)
      If AutoOpen
        LinkedRefs[I].SetOpen(True)
      EndIf
      I += 1
    EndWhile
  EndIf
EndEvent
