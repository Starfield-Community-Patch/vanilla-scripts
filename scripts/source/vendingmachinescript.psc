ScriptName VendingMachineScript Extends ObjectReference
{ Handles Vending Machine activation behavior. }

;-- Variables ---------------------------------------
Int allowedActivations
Int usedActivations

;-- Properties --------------------------------------
Group DefaultProperties
  Int Property minActivations = 4 Auto Const
  { The minimum number of times this vending machine can be activated. }
  Int Property maxActivations = 7 Auto Const
  { The maximum number of times this vending machine can be activated. }
  Float Property doubleVendChance = 1.0 Auto Const
  { The chance (0.0 - 100.0) of the machine giving you an extra item. }
EndGroup

Group RequiredProperties
  LeveledItem Property itemsToVend Auto Const mandatory
  { The list of items to vend. }
  GlobalVariable Property cost Auto Const mandatory
  { The cost to despense an item. The cost is displayed in the Activator's activation display text. }
  wwiseevent Property WwiseEvent_VendingMachineActivate Auto Const mandatory
  { The sound to player when the vending machine successfully dispenses an item. }
  wwiseevent Property WwiseEvent_VendingMachineActivateError Auto Const mandatory
  { The sound to play if the player attempts to activate it after all of its items have been dispensed. }
  Message Property notEnoughCreditsMessage Auto Const mandatory
  { The message notification to display if the player doesn't have enough credits. }
  ActorValue Property VendingMachineResetGameTimeAV Auto Const mandatory
EndGroup

Group OptionalProperties
  LeveledItem Property rareItemsToVend Auto Const
  { An optional set of very rare items to vend. }
  Float Property rareItemChance = 0.0 Auto Const
  { The chance (0.0 - 100.0) of spawning a rare item, if rareItemsToVend is set. }
  Int Property daysUntilReset = 0 Auto Const
  { Optionally specify the days until this machine can begin vending again. By default, it stops vending until the cell is reset. }
EndGroup


;-- Functions ---------------------------------------

Function ResetVendingMachine()
  usedActivations = 0
  allowedActivations = Utility.RandomInt(minActivations, maxActivations)
EndFunction

Function TryToVendItem()
  Actor playerRef = Game.GetPlayer()
  MiscObject credits = Game.GetCredits()
  Int costValue = cost.GetValueInt()
  If playerRef.GetItemCount(credits as Form) < costValue
    Self.PlayErrorSound()
    notEnoughCreditsMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    Return 
  EndIf
  playerRef.RemoveItem(credits as Form, costValue, False, None)
  usedActivations += 1
  Self.HandleVendingItem()
EndFunction

Function HandleVendingItem()
  Self.DispenseItem()
  Bool doubleSuccess = Utility.RandomFloat(0.0, 100.0) <= doubleVendChance
  If doubleSuccess
    Self.DispenseItem()
  EndIf
EndFunction

Function DispenseItem()
  Self.PlayDispenseSound()
  Game.GetPlayer().AddItem(Self.GetItemToVend() as Form, 1, False)
EndFunction

LeveledItem Function GetItemToVend()
  If rareItemsToVend as Bool && rareItemChance > 0.0
    Bool rareSuccess = Utility.RandomFloat(0.0, 100.0) <= rareItemChance
    If rareSuccess
      Return rareItemsToVend
    Else
      Return itemsToVend
    EndIf
  Else
    Return itemsToVend
  EndIf
EndFunction

Function PlayErrorSound()
  Int S = WwiseEvent_VendingMachineActivateError.Play(Self as ObjectReference, None, None)
EndFunction

Function PlayDispenseSound()
  Bool S = WwiseEvent_VendingMachineActivate.PlayAndWait(Self as ObjectReference, None, None)
EndFunction

;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActivator)
    Self.PlayErrorSound()
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnLoad()
    Self.ResetVendingMachine()
    Self.GoToState("Ready")
  EndEvent
EndState

;-- State -------------------------------------------
State Ready

  Event OnActivate(ObjectReference akActivator)
    Self.GoToState("Working")
    If akActivator == Game.GetPlayer() as ObjectReference
      Self.TryToVendItem()
    EndIf
    If usedActivations >= allowedActivations
      Self.GoToState("SoldOut")
    Else
      Self.GoToState("Ready")
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State SoldOut

  Event OnActivate(ObjectReference akActivator)
    Self.PlayErrorSound()
  EndEvent

  Event OnLoad()
    If Utility.GetCurrentGameTime() >= Self.GetValue(VendingMachineResetGameTimeAV)
      Self.ResetVendingMachine()
      Self.GoToState("Ready")
    EndIf
  EndEvent

  Event OnBeginState(String asOldState)
    If daysUntilReset > 0
      Self.SetValue(VendingMachineResetGameTimeAV, Utility.GetCurrentGameTime() + daysUntilReset as Float)
    Else
      Self.GoToState("Done")
    EndIf
  EndEvent
EndState

;-- State -------------------------------------------
State Working

  Event OnActivate(ObjectReference akActivator)
    ; Empty function
  EndEvent
EndState
