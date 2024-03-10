ScriptName Fragments:Quests:QF_DialogueCFTheKey_RandomId_0000D725 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Pirat01 Auto Const mandatory
ReferenceAlias Property Alias_Pirat02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference Pirate01 = Alias_Pirat01.GetRef()
  ObjectReference Pirate02 = Alias_Pirat02.GetRef()
  Pirate01.DisableNoWait(False)
  Pirate02.DisableNoWait(False)
  Pirate01.Delete()
  Pirate02.Delete()
EndFunction
