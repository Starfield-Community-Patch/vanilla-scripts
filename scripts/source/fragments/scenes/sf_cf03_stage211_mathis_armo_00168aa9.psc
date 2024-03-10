ScriptName Fragments:Scenes:SF_CF03_Stage211_Mathis_Armo_00168AA9 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CF03_ArmoryWeaponCase Auto Const
ReferenceAlias Property Alias_CF03_ArmoryWeaponCaseCollision Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_Begin()
  ObjectReference weaponCase = Alias_CF03_ArmoryWeaponCase.GetRef()
  weaponCase.BlockActivation(True, True)
EndFunction

Function Fragment_Phase_03_Begin()
  ObjectReference weaponCase = Alias_CF03_ArmoryWeaponCase.GetRef()
  weaponCase.Unlock(False)
  weaponCase.SetOpen(True)
EndFunction

Function Fragment_Phase_05_Begin()
  Self.GetOwningQuest().SetStageNoWait(213)
EndFunction
