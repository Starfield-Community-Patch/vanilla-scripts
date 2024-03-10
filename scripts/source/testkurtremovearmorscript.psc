ScriptName TestKurtRemoveArmorScript Extends Actor Const
{ test removing armor when armor is looted }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property TestKurtArmorKeywords Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(TestKurtArmorKeywords as Form)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Keyword keywordToRemove = Self.GetArmorKeyword(akBaseItem)
  If keywordToRemove
    Self.RemoveItem(keywordToRemove as Form, 1, False, None)
  EndIf
EndEvent

Keyword Function GetArmorKeyword(Form akBaseItem)
  If akBaseItem.HasKeywordInFormList(TestKurtArmorKeywords)
    Int I = 0
    While I < TestKurtArmorKeywords.GetSize()
      Keyword theKeyword = TestKurtArmorKeywords.GetAt(I) as Keyword
      If theKeyword
        If akBaseItem.HasKeyword(theKeyword)
          Return theKeyword
        EndIf
      EndIf
      I += 1
    EndWhile
  EndIf
  Return None
EndFunction
