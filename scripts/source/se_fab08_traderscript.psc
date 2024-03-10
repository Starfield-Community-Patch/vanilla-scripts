ScriptName SE_FAB08_TraderScript Extends ReferenceAlias
{ Handles setting globals that prevent the respawn of Legendary Weapons from the Starborn Trader Ship Vendor. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group required
  FormList Property SE_FAB08_LegendaryWeaponTypes Auto Const mandatory
  { Formlist of weapon types to filter by. }
  Keyword[] Property LegendaryWeaponKeywords Auto Const mandatory
  { An array of keywords attached to Legendary weapons that we wish to handle. }
  GlobalVariable[] Property LegendaryWeaponGlobals Auto Const mandatory
  { An array of globals that prevent the corresponding weapon from spawning again. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(SE_FAB08_LegendaryWeaponTypes as Form)
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Int I = 0
  Bool keywordFound = False
  While I < LegendaryWeaponKeywords.Length && !keywordFound
    Keyword myKeyword = LegendaryWeaponKeywords[I]
    GlobalVariable myGlobal = LegendaryWeaponGlobals[I]
    If akItemReference.HasKeyword(myKeyword)
      myGlobal.SetValueInt(100)
      keywordFound = True
    EndIf
    I += 1
  EndWhile
EndEvent
