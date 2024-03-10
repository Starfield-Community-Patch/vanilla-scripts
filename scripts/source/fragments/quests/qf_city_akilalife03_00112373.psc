ScriptName Fragments:Quests:QF_City_AkilaLife03_00112373 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property FAB_Book_TheCountOfMonteCristo_m Auto Const mandatory
Book Property EAW_Book_Dracula_m Auto Const mandatory
Book Property EAW_Book_HistoryOfPyrates_m Auto Const mandatory
Book Property EAW_Book_LastDays_m Auto Const mandatory
Book Property EAW_Book_MobyDick_m Auto Const mandatory
Book Property EAW_Book_SpaceAndTime_m Auto Const mandatory
Book Property EAW_Book_TheComet_m Auto Const mandatory
Book Property EAW_Book_WarOfWorlds_m Auto Const mandatory
GlobalVariable Property AkilaLife03_BookReturnCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0210_Item_00()
  Game.GetPlayer().RemoveItem(FAB_Book_TheCountOfMonteCristo_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0220_Item_00()
  Game.GetPlayer().RemoveItem(EAW_Book_Dracula_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0230_Item_00()
  Game.GetPlayer().RemoveItem(EAW_Book_HistoryOfPyrates_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0240_Item_00()
  Game.GetPlayer().RemoveItem(EAW_Book_LastDays_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0250_Item_00()
  Game.GetPlayer().RemoveItem(EAW_Book_MobyDick_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0260_Item_00()
  Game.GetPlayer().RemoveItem(EAW_Book_SpaceAndTime_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0270_Item_00()
  Game.GetPlayer().RemoveItem(EAW_Book_TheComet_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_0280_Item_00()
  Game.GetPlayer().RemoveItem(EAW_Book_WarOfWorlds_m as Form, 1, False, None)
  AkilaLife03_BookReturnCount.Mod(1.0)
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop()
EndFunction
