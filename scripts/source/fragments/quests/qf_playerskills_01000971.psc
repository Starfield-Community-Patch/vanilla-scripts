ScriptName Fragments:Quests:QF_PlayerSkills_01000971 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory
Int Property FitnessHealthBonus = 10 Auto Const
ActorValue Property CarryWeight Auto Const mandatory
Int Property CarryWeightBonus = 10 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0101_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0102_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0103_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0104_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0105_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0111_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0112_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0113_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0114_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0115_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float)
EndFunction

Function Fragment_Stage_0201_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float)
EndFunction

Function Fragment_Stage_0202_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float)
EndFunction

Function Fragment_Stage_0203_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float)
EndFunction

Function Fragment_Stage_0204_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float)
EndFunction

Function Fragment_Stage_0205_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float)
EndFunction
