ScriptName DefaultAddItemOnActivate Extends ObjectReference
{ Give the player an item when they activate this reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Form Property ItemToGive Auto Const
{ The Item to give to the player when this references is activated. }
Int Property NumberToGiveMin = 1 Auto Const
{ How many of the item are given?  If always the same, Min and Max should be equal.  Otherwise it's a random value between min/max }
Int Property NumberToGiveMax = 1 Auto Const
{ If Greater than the Min, the number given will be randomized between that value and this one. }
Bool Property DisableWhenDone = False Auto Const
{ Should this object disable when clicked?  False by default. }

;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnActivate(ObjectReference akActionRef)
    Int iNumberToGive = 0
    If NumberToGiveMin >= NumberToGiveMax
      iNumberToGive = NumberToGiveMin
    Else
      iNumberToGive = Utility.randomInt(NumberToGiveMin, NumberToGiveMax)
    EndIf
    akActionRef.AddItem(ItemToGive, iNumberToGive, False)
    If DisableWhenDone
      Self.disable(False)
    Else
      Self.GoToState("Done")
    EndIf
  EndEvent
EndState
