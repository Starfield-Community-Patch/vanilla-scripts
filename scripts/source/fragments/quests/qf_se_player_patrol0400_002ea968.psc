ScriptName Fragments:Quests:QF_SE_Player_Patrol0400_002EA968 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Patrollers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Utility.wait(11.0)
  (Alias_Patrollers.GetAt(0) as spaceshipreference).EnableWithGravJumpNoWait()
  Utility.wait(Utility.randomfloat(0.200000003, 3.900000095))
  (Alias_Patrollers.GetAt(1) as spaceshipreference).EnableWithGravJumpNoWait()
  Utility.wait(Utility.randomfloat(0.200000003, 3.900000095))
  (Alias_Patrollers.GetAt(2) as spaceshipreference).EnableWithGravJumpNoWait()
EndFunction
