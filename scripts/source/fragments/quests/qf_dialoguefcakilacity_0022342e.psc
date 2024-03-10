ScriptName Fragments:Quests:QF_DialogueFCAkilaCity_0022342E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ObjectReference Property FC01_BankRobbersEnableMarker Auto Const mandatory
Quest Property FC01 Auto Const mandatory
Quest Property RAD03 Auto Const mandatory
ReferenceAlias Property Alias_DuncanLynch Auto Const mandatory
Quest Property City_AkilaLife01 Auto Const mandatory
Quest Property City_AkilaLife02 Auto Const mandatory
GlobalVariable Property PlayerHouse_AC_CoreCost Auto Const mandatory
GlobalVariable Property PlayerHouse_AC_MidtownCost Auto Const mandatory
Scene Property AkilaCity_Earl_SnuckIn Auto Const mandatory
Quest Property City_AkilaLife04 Auto Const mandatory
Quest Property City_AkilaLife06 Auto Const mandatory
Quest Property City_AkilaLife08 Auto Const mandatory
Key Property CityAkilaCityCoreHouseKey Auto Const mandatory
Quest Property UC_AC_Home_CoreHouse_Misc Auto Const mandatory
Quest Property FC_AC_Home_MidtownHouse_Misc Auto Const mandatory
Key Property CityAkilaCityMidtownHouseKey Auto Const mandatory
Scene Property AkilaCityLife_2010_Davis Auto Const mandatory
ReferenceAlias Property Alias_AugustBowen Auto Const mandatory
Quest Property City_Akila_Jansen Auto Const mandatory
ReferenceAlias Property Alias_JustinSnead Auto Const mandatory
Quest Property City_AkilaLife03 Auto Const mandatory
Quest Property City_AkilaLife07 Auto Const mandatory
Quest Property City_AC_FAB_Quest18 Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
ReferenceAlias Property Alias_EarlFulton Auto Const mandatory
GlobalVariable Property City_AC_LowHouseDonation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0110_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0115_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0000_Item_00()
  FC01.SetStage(2000)
  FC01_BankRobbersEnableMarker.Disable(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_DuncanLynch.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  City_AkilaLife06.Start()
  City_AkilaLife08.Start()
  City_Akila_Jansen.Start()
  City_AkilaLife03.Start()
  City_AkilaLife07.Start()
EndFunction

Function Fragment_Stage_0105_Item_00()
  City_AkilaLife02.Start()
EndFunction

Function Fragment_Stage_0112_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, City_AC_LowHouseDonation.GetValue() as Int, False, None)
EndFunction

Function Fragment_Stage_0117_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, 10, False, None)
EndFunction

Function Fragment_Stage_0119_Item_00()
  AkilaCity_Earl_SnuckIn.Start()
EndFunction

Function Fragment_Stage_0200_Item_00()
  RAD03.Start()
EndFunction

Function Fragment_Stage_0525_Item_00()
  City_AkilaLife04.Start()
EndFunction

Function Fragment_Stage_0810_Item_00()
  PlayerHouseSystem.PurchaseHouse(PlayerHouse_AC_MidtownCost, CityAkilaCityMidtownHouseKey)
  FC_AC_Home_MidtownHouse_Misc.Start()
EndFunction

Function Fragment_Stage_0820_Item_00()
  PlayerHouseSystem.PurchaseHouse(PlayerHouse_AC_CoreCost, CityAkilaCityCoreHouseKey)
  UC_AC_Home_CoreHouse_Misc.Start()
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_AkilaLife01.Start()
EndFunction

Function Fragment_Stage_2015_Item_00()
  AkilaCityLife_2010_Davis.Stop()
EndFunction
