ScriptName SE_DB05Script Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property ManufacturedItems_All Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_ItemNeeded Auto Const mandatory
Float Property hasManufacturedItem = 0.0 Auto conditional hidden
GlobalVariable Property SE_Player_DB05_ItemValueGlobal Auto mandatory
Form Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.PopulateNeededItem()
EndEvent

Form Function CheckInventory()
  Form[] PlayersManufacturedItems = new Form[0]
  Int I = 0
  Int formListSize = ManufacturedItems_All.GetSize()
  While I < formListSize
    If Game.GetPlayer().GetItemCount(ManufacturedItems_All.GetAt(I)) > 0
      PlayersManufacturedItems.add(ManufacturedItems_All.GetAt(I), 1)
    EndIf
    I += 1
  EndWhile
  Int currentAmount = Game.GetPlayer().GetItemCount(PlayersManufacturedItems[0])
  Form currentItem = PlayersManufacturedItems[0]
  Int j = 1
  While j < PlayersManufacturedItems.Length
    If Game.GetPlayer().GetItemCount(PlayersManufacturedItems[j]) < currentAmount
      currentAmount = Game.GetPlayer().GetItemCount(PlayersManufacturedItems[j])
      currentItem = PlayersManufacturedItems[j]
    EndIf
    j += 1
  EndWhile
  Return currentItem
EndFunction

Function PopulateNeededItem()
  Form manufacturedItem = Self.CheckInventory()
  If manufacturedItem
    hasManufacturedItem = 1.0
  Else
    manufacturedItem = (ManufacturedItems_All.GetAt(Utility.RandomInt(0, ManufacturedItems_All.GetSize() - 1)) as ObjectReference) as Form
  EndIf
  Alias_HailingShip.GetShipRef().AddAliasedItem(manufacturedItem, Alias_ItemNeeded as Alias, 1, True)
  SE_Player_DB05_ItemValueGlobal.SetValueInt(manufacturedItem.GetGoldValue() * 2)
  Alias_HailingShip.GetShipRef().AddItem(Credits, SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2, False)
EndFunction

Function GiveItem()
  If Game.GetPlayer().GetItemCount(Alias_ItemNeeded.GetRef() as Form) > 0 && Alias_HailingShip.GetShipRef().GetItemCount(Credits) >= SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2
    Game.GetPlayer().RemoveItem(Alias_ItemNeeded.GetRef() as Form, 1, False, None)
    Alias_HailingShip.GetShipRef().AddItem(Alias_ItemNeeded.GetRef() as Form, 1, False)
    Game.GetPlayer().AddItem(Credits, SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2, False)
    Alias_HailingShip.GetShipRef().RemoveItem(Credits, SE_Player_DB05_ItemValueGlobal.GetValueInt() * 2, False, None)
  EndIf
EndFunction
