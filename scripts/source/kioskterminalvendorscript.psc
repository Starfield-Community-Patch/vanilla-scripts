ScriptName KioskTerminalVendorScript Extends TerminalMenu
{ script for terminals that act as vending machines }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Form[] Property ItemsForSale Auto Const
{ array of items for sale at this vending machine }
ActorValue Property KioskTerminalItemCount Auto Const mandatory
{ set when initialized, for conditioning menu items }
ActorValue Property KioskTerminalInitialized Auto Const mandatory
{ set to 1 when initialized }
ActorValue Property KioskTerminalNoSaleFlag Auto Const mandatory
{ set to 1 if the player tries to buy something with not enough credits }
TerminalMenu Property KioskTerminalMenu Auto Const mandatory
{ the main terminal menu for this kiosk }

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalRef.GetValue(KioskTerminalInitialized) == 0.0
    akTerminalRef.SetValue(KioskTerminalInitialized, 1.0)
    Int I = 0
    While I < ItemsForSale.Length
      Form theItem = ItemsForSale[I]
      akTerminalRef.AddTextReplacementData("MiscItem" + I as String, theItem)
      Int itemValue = theItem.GetGoldValue()
      akTerminalRef.AddTextReplacementValue(("MiscItem" + I as String) + "value", itemValue as Float)
      I += 1
    EndWhile
    akTerminalRef.SetValue(KioskTerminalItemCount, I as Float)
  EndIf
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == KioskTerminalMenu
    Form theItem = ItemsForSale[auiMenuItemID]
    If theItem
      akTerminalRef.AddTextReplacementData("SaleItem", theItem)
      MiscObject credits = Game.GetCredits()
      Actor player = Game.GetPlayer()
      Int playerCredits = player.GetItemCount(credits as Form)
      Int cost = theItem.GetGoldValue()
      If playerCredits >= cost
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 0.0)
        player.RemoveItem(credits as Form, cost, False, None)
        player.Additem(theItem, 1, False)
      Else
        akTerminalRef.SetValue(KioskTerminalNoSaleFlag, 1.0)
      EndIf
    EndIf
  EndIf
EndEvent
