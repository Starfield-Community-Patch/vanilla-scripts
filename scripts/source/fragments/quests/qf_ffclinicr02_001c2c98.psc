ScriptName Fragments:Quests:QF_FFClinicR02_001C2C98 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property OrgCommonToxin Auto Const mandatory
MiscObject Property OrgUncommonAntibiotic Auto Const mandatory
MiscObject Property OrgUncommonMembrane Auto Const mandatory
MiscObject Property OrgCommonSealant Auto Const mandatory
MiscObject Property OrgRareAnalgesic Auto Const mandatory
MiscObject Property OrgRareSedative Auto Const mandatory
MiscObject Property OrgExoticNarcotic Auto Const mandatory
MiscObject Property OrgExoticBiosuppressant Auto Const mandatory
ReferenceAlias Property Alias_ResourceAlias Auto Const mandatory
GlobalVariable Property FFClinicR02ResourceNumber Auto Const mandatory
GlobalVariable Property FFClinicR02ItemTotal Auto Const mandatory
GlobalVariable Property FFClinicR02ItemCount Auto Const mandatory
GlobalVariable Property FFClinicR02CompletionNumber Auto Const
GlobalVariable Property FFClinicR02DaysPassed Auto Const mandatory
GlobalVariable Property GameDaysPassed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest
  ffclinicr02questscript kmyQuest = __temp as ffclinicr02questscript
  FFClinicR02ResourceNumber.SetValueInt(Utility.RandomInt(1, 8))
  If FFClinicR02ResourceNumber.GetValue() == 1.0
    Game.GetPlayer().PlaceAtMe(OrgCommonToxin as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(10)
  ElseIf FFClinicR02ResourceNumber.GetValue() == 2.0
    Game.GetPlayer().PlaceAtMe(OrgCommonSealant as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(10)
  ElseIf FFClinicR02ResourceNumber.GetValue() == 3.0
    Game.GetPlayer().PlaceAtMe(OrgUncommonMembrane as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(7)
  ElseIf FFClinicR02ResourceNumber.GetValue() == 4.0
    Game.GetPlayer().PlaceAtMe(OrgUncommonAntibiotic as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(7)
  ElseIf FFClinicR02ResourceNumber.GetValue() == 5.0
    Game.GetPlayer().PlaceAtMe(OrgRareAnalgesic as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(5)
  ElseIf FFClinicR02ResourceNumber.GetValue() == 6.0
    Game.GetPlayer().PlaceAtMe(OrgRareSedative as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(5)
  ElseIf FFClinicR02ResourceNumber.GetValue() == 7.0
    Game.GetPlayer().PlaceAtMe(OrgExoticNarcotic as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(3)
  ElseIf FFClinicR02ResourceNumber.GetValue() == 8.0
    Game.GetPlayer().PlaceAtMe(OrgExoticBiosuppressant as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True)
    FFClinicR02ItemTotal.SetValueInt(3)
  EndIf
  kmyQuest.CalculateRewards()
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False)
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  ffclinicr02questscript kmyQuest = __temp as ffclinicr02questscript
  kmyQuest.RemoveResourceItems()
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest
  ffclinicr02questscript kmyQuest = __temp as ffclinicr02questscript
  Self.CompleteAllObjectives()
  FFClinicR02CompletionNumber.Mod(1.0)
  Utility.Wait(1.0)
  FFClinicR02ItemCount.SetValueInt(0)
  FFClinicR02DaysPassed.SetValue(GameDaysPassed.GetValue() + 1.0)
  Self.Stop()
EndFunction
