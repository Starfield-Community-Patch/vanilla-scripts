ScriptName RAD06Script Extends Quest

;-- Structs -----------------------------------------
Struct ResourcesInfo
  Int ResourceID
  { This is the ID number of the resource. }
  MiscObject ResourceObject
  { This is the misc item tied to the actual resource. }
  Int PricePerUnit
  { This is how much you are paid for delivering the resources }
  ReferenceAlias NameReference
  { This is the Reference Alias that has the name of the Resource }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
rad06script:resourcesinfo[] Property ResourceInfo Auto Const
{ Array of all the Resource info for RAD06 }
GlobalVariable Property RAD06_CurrentQuantity Auto Const mandatory
GlobalVariable Property RAD06_CurrentReward Auto Const mandatory
GlobalVariable Property RAD06_Quantity_01_Low Auto Const mandatory
GlobalVariable Property RAD06_Quantity_02_Medium Auto Const mandatory
GlobalVariable Property RAD06_Quantity_03_High Auto Const mandatory
GlobalVariable Property RAD06_EndValue Auto Const mandatory
Perk Property Scanning Auto Const mandatory
ActorValue Property RAD06_ResourceCheckAV Auto Const mandatory
ActorValue Property RAD06_CurrentQuantityAV Auto Const mandatory
ActorValue Property RAD06_DeliveryAmountAV Auto Const mandatory
ReferenceAlias Property PlayerShipInventory Auto Const
ReferenceAlias Property QuestGiver Auto Const
ReferenceAlias Property ResourceName Auto Const
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function InitResource()
{ Pick a resource and quantity }
  Actor aPlayer = Game.GetPlayer()
  Int nResourceID = 0
  nResourceID = Utility.RandomInt(1, RAD06_EndValue.GetValue() as Int)
  QuestGiver.GetRef().SetValue(RAD06_ResourceCheckAV, nResourceID as Float)
  ResourceName.ForceRefTo(ResourceInfo[nResourceID - 1].NameReference.GetRef())
  Int nRandomQuantity = Utility.RandomInt(1, 3)
  Float fActualQuantity = 0.0
  If nRandomQuantity == 1
    fActualQuantity = RAD06_Quantity_01_Low.GetValue()
  ElseIf nRandomQuantity == 2
    fActualQuantity = RAD06_Quantity_02_Medium.GetValue()
  Else
    fActualQuantity = RAD06_Quantity_03_High.GetValue()
  EndIf
  RAD06_CurrentQuantity.SetValue(fActualQuantity)
  QuestGiver.GetRef().SetValue(RAD06_CurrentQuantityAV, fActualQuantity)
  Float fResourceReward = ResourceInfo[nResourceID - 1].PricePerUnit as Float
  Float fCreditReward = RAD06_CurrentQuantity.GetValue() * fResourceReward
  RAD06_CurrentReward.SetValue(fCreditReward)
  (PlayerShipInventory as rad06playeraliasscript).ResourceToLookFor = ResourceInfo[nResourceID - 1].ResourceObject
  (PlayerShipInventory as rad06playeraliasscript).QuantityToLookFor = RAD06_CurrentQuantity.GetValue() as Int
  (PlayerShipInventory as rad06playeraliasscript).RefreshFilter()
  Self.UpdateCurrentInstanceGlobal(RAD06_CurrentQuantity)
  Self.UpdateCurrentInstanceGlobal(RAD06_CurrentReward)
EndFunction

Bool Function CargoHoldResourceCheck()
{ Check to see if the player has the right mats in her cargo hold right now }
  Actor aQuestGiver = QuestGiver.GetActorRef()
  Int nResourceID = aQuestGiver.GetValue(RAD06_ResourceCheckAV) as Int
  Int nFullQuantity = aQuestGiver.GetValue(RAD06_CurrentQuantityAV) as Int
  Int nCurrentQuantity = PlayerShipInventory.GetRef().GetItemCount(ResourceInfo[nResourceID - 1].ResourceObject as Form)
  If nCurrentQuantity >= nFullQuantity
    nCurrentQuantity = nFullQuantity
    Self.SetStage(200)
  EndIf
  aQuestGiver.SetValue(RAD06_DeliveryAmountAV, nCurrentQuantity as Float)
  If nCurrentQuantity > 0
    PlayerShipInventory.GetRef().RemoveItem(ResourceInfo[nResourceID - 1].ResourceObject as Form, nCurrentQuantity, False, None)
    Int nCreditsToReward = nCurrentQuantity * ResourceInfo[nResourceID - 1].PricePerUnit
    Game.GetPlayer().AddItem(Credits as Form, nCreditsToReward, False)
    Int nNewFullQuantity = nFullQuantity - nCurrentQuantity
    aQuestGiver.SetValue(RAD06_CurrentQuantityAV, nNewFullQuantity as Float)
    RAD06_CurrentQuantity.SetValue(nNewFullQuantity as Float)
    If !Self.GetStageDone(200)
      Self.UpdateCurrentInstanceGlobal(RAD06_CurrentQuantity)
    EndIf
  EndIf
EndFunction
