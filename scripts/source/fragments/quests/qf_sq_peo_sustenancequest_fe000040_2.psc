ScriptName Fragments:Quests:QF_SQ_PEO_SustenanceQuest_FE000040_2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property PEO_WellFedPotion Auto Const mandatory
Potion Property NEW_PEO_WellHydratedPotion Auto Const mandatory
Message Property PEO_WellHydrated_Msg Auto Const mandatory
Message Property PEO_WellFed_Msg Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest
  peo:peo_sustenancestart kmyQuest = __temp as peo:peo_sustenancestart
  Actor PlayerREF = Game.GetPlayer()
  PlayerREF.equipitem(PEO_WellFedPotion as Form, False, True)
  PEO_WellFed_Msg.show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
  PlayerREF.equipitem(NEW_PEO_WellHydratedPotion as Form, False, True)
  PEO_WellHydrated_Msg.show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
EndFunction
