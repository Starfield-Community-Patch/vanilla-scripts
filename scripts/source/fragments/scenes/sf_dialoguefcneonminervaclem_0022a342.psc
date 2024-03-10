ScriptName Fragments:Scenes:SF_DialogueFCNeonMinervaClem_0022A342 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Neon_VoliiHotel_RentCount Auto Const
GlobalVariable Property Neon_VoliiHotel_RentCost Auto Const
MiscObject Property Credits Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  Game.GetPlayer().RemoveItem(Credits as Form, Neon_VoliiHotel_RentCost.GetValueInt(), False, None)
  If Neon_VoliiHotel_RentCount.GetValue() < 4.0
    Neon_VoliiHotel_RentCount.SetValue(Neon_VoliiHotel_RentCount.GetValue() + 1.0)
  EndIf
EndFunction
