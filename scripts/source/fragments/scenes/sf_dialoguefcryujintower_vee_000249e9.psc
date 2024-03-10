ScriptName Fragments:Scenes:SF_DialogueFCRyujinTower_Vee_000249E9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property DR017_DataCredits Auto Const mandatory
GlobalVariable Property DR017_DataCreditsHigh Auto Const mandatory
GlobalVariable Property DR017_DemandedHighPrice Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Book Property DR017_ValuableData01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End()
  Actor PlayerREF = Game.GetPlayer()
  Int DataCount = PlayerREF.GetItemCount(DR017_ValuableData01 as Form)
  Float fDemandedHighPrice = DR017_DemandedHighPrice.GetValue()
  If fDemandedHighPrice == 1.0
    PlayerREF.AddItem(Credits as Form, DataCount * DR017_DataCreditsHigh.GetValueInt(), False)
  Else
    PlayerREF.AddItem(Credits as Form, DataCount * DR017_DataCredits.GetValueInt(), False)
  EndIf
  PlayerREF.RemoveItem(DR017_ValuableData01 as Form, DataCount, False, None)
EndFunction
