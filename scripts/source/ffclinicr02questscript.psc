ScriptName FFClinicR02QuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property OrgCommonToxin Auto Const mandatory
MiscObject Property OrgCommonSealant Auto Const mandatory
MiscObject Property OrgUncommonMembrane Auto Const mandatory
MiscObject Property OrgUncommonAntibiotic Auto Const mandatory
MiscObject Property OrgRareAnalgesic Auto Const mandatory
MiscObject Property OrgRareSedative Auto Const mandatory
MiscObject Property OrgExoticNarcotic Auto Const mandatory
MiscObject Property OrgExoticBiosuppressant Auto Const mandatory
GlobalVariable Property FFClinicR02ResourceNumber Auto Const mandatory
GlobalVariable Property FFClinicR02ItemTotal Auto Const mandatory
GlobalVariable Property FFClinicR02Reward Auto Const mandatory
resource Property ResourceOrgCommonSealant Auto Const
resource Property ResCommonToxin Auto Const
resource Property ResOrgExoticBiosuppressant Auto Const
resource Property ResOrgExoticNarcotic Auto Const
resource Property ResOrgRareAnalgesic Auto Const
resource Property ResOrgRareSedative Auto Const
resource Property ResOrgUncommonAntibiotic Auto Const
resource Property ResOrgUncommonMembrane Auto Const

;-- Functions ---------------------------------------

Function CalculateRewards()
  If FFClinicR02ResourceNumber.GetValueInt() == 1
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgCommonToxin.GetGoldValue()) as Float * 1.5)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 2
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgCommonSealant.GetGoldValue()) as Float * 1.5)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 3
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgUncommonMembrane.GetGoldValue()) as Float * 1.5)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 4
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgUncommonAntibiotic.GetGoldValue()) as Float * 1.5)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 5
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgRareAnalgesic.GetGoldValue()) as Float * 1.5)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 6
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgRareSedative.GetGoldValue()) as Float * 1.5)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 7
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgExoticNarcotic.GetGoldValue()) as Float * 1.5)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 8
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgExoticBiosuppressant.GetGoldValue()) as Float * 1.5)
  EndIf
  Self.UpdateCurrentInstanceGlobal(FFClinicR02ItemTotal)
EndFunction

Function RemoveResourceItems()
  If FFClinicR02ResourceNumber.GetValueInt() == 1
    Game.GetPlayer().RemoveItem(ResCommonToxin as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 2
    Game.GetPlayer().RemoveItem(ResourceOrgCommonSealant as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 3
    Game.GetPlayer().RemoveItem(ResOrgUncommonMembrane as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 4
    Game.GetPlayer().RemoveItem(ResOrgUncommonAntibiotic as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 5
    Game.GetPlayer().RemoveItem(ResOrgRareAnalgesic as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 6
    Game.GetPlayer().RemoveItem(ResOrgRareSedative as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 7
    Game.GetPlayer().RemoveItem(ResOrgExoticNarcotic as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 8
    Game.GetPlayer().RemoveItem(ResOrgExoticBiosuppressant as Form, FFClinicR02ItemTotal.GetValueInt(), False, None)
  EndIf
  Self.SetStage(200)
EndFunction
