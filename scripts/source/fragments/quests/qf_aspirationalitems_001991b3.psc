ScriptName Fragments:Quests:QF_AspirationalItems_001991B3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VendorCyUCExchange Auto Const mandatory
ObjectReference Property CYDenisContainerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If !VendorCyUCExchange.GetRef()
    VendorCyUCExchange.ForceRefTo(CYDenisContainerRef)
  EndIf
EndFunction
