ScriptName Fragments:Quests:QF_SE_Player_ZW11_000518F0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PSE_Global_Player_ZW12_RevengeEncounters Auto Const mandatory
RefCollectionAlias Property Alias_AttackersRC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  PSE_Global_Player_ZW12_RevengeEncounters.Mod(1.0)
  Utility.wait(7.0)
  Int I = 0
  While I < Alias_AttackersRC.GetCount()
    (Alias_AttackersRC.GetAt(I) as spaceshipreference).EnableWithGravJumpNoWait()
    Utility.wait(Utility.randomfloat(0.200000003, 3.900000095))
    I += 1
  EndWhile
EndFunction
