ScriptName Fragments:Quests:QF_SE_Player_DevVid_0023CA8C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_Ship02 Auto Const mandatory
ReferenceAlias Property Alias_Ship03 Auto Const mandatory
ReferenceAlias Property Alias_Ship04 Auto Const mandatory
ReferenceAlias Property Alias_Ship05 Auto Const mandatory
ReferenceAlias Property Alias_Ship06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  spaceshipreference Ship01 = Alias_Ship01.GetRef() as spaceshipreference
  spaceshipreference Ship02 = Alias_Ship02.GetRef() as spaceshipreference
  spaceshipreference Ship03 = Alias_Ship03.GetRef() as spaceshipreference
  Utility.wait(7.0)
  Ship01.EnableWithGravJump()
  Utility.wait(1.0)
  Ship02.EnableWithGravJump()
  Utility.wait(1.0)
  Ship03.EnableWithGravJump()
EndFunction

Function Fragment_Stage_0030_Item_00()
  spaceshipreference Ship04 = Alias_Ship04.GetRef() as spaceshipreference
  spaceshipreference Ship05 = Alias_Ship05.GetRef() as spaceshipreference
  spaceshipreference Ship06 = Alias_Ship06.GetRef() as spaceshipreference
  Utility.wait(1.0)
  Ship04.EnableWithGravJump()
  Utility.wait(1.0)
  Ship05.EnableWithGravJump()
  Utility.wait(1.0)
  Ship06.EnableWithGravJump()
EndFunction
