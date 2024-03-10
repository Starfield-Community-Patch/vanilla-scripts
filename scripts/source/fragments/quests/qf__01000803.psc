ScriptName Fragments:Quests:QF__01000803 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PRI03_MalaiDead Auto Const mandatory
ReferenceAlias Property Alias_Datura Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Utility.wait(5.0)
  spaceshipreference myShip = Alias_Datura.GetRef() as spaceshipreference
  myShip.enablewithgravjump()
  myShip.StartCombat(Alias_PlayerShip.GetRef() as spaceshipreference, False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  PRI03_MalaiDead.SetValue(1.0)
EndFunction
