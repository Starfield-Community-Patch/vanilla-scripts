ScriptName Fragments:Quests:QF_SE_Player_Bountyships_UC_000C3834 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BountyShip01 Auto Const mandatory
ReferenceAlias Property Alias_BountyShip02 Auto Const mandatory
ReferenceAlias Property Alias_BountyShip03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Utility.wait(7.0)
  spaceshipreference myship01 = Alias_BountyShip01.GetRef() as spaceshipreference
  myship01.enablewithgravjump()
  Utility.wait(1.0)
  spaceshipreference myship02 = Alias_BountyShip02.GetRef() as spaceshipreference
  myship02.enablewithgravjump()
  Utility.wait(0.300000012)
  spaceshipreference myship03 = Alias_BountyShip03.GetRef() as spaceshipreference
  myship03.enablewithgravjump()
EndFunction
