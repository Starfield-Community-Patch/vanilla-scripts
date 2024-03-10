ScriptName sq_playerhousescript Extends Quest
{ Handle common functionality when player homes are purchased. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group autofill
  LeveledItem Property LL_HousePurchase_BuildingSupplies Auto Const mandatory
  { The building supplies to grant the player when purchasing a home. }
  Message Property HousePurchaseBuildingMaterialsMessage Auto Const mandatory
  { The message to display when depositing building materials into their ship cargo hold. }
EndGroup


;-- Functions ---------------------------------------

Function PurchaseHouse(GlobalVariable purchaseAmount, Key houseKey)
  If purchaseAmount
    Game.GetPlayer().RemoveItem(Game.GetCredits() as Form, purchaseAmount.GetValueInt(), False, None)
  EndIf
  If houseKey
    Game.GetPlayer().AddItem(houseKey as Form, 1, False)
  EndIf
  Game.GetPlayerHomeSpaceShip().AddItem(LL_HousePurchase_BuildingSupplies as Form, 1, False)
  HousePurchaseBuildingMaterialsMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction
