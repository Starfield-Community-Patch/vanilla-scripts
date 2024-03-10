ScriptName Fragments:Quests:QF_MQ104B_LinHeller_BaseDial_0027E279 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Int iHirePrice = 0
  If Self.GetStageDone(20) == True
    iHirePrice = 250
  Else
    iHirePrice = 500
  EndIf
  Game.GetPlayer().removeitem(Credits as Form, iHirePrice, False, None)
EndFunction
