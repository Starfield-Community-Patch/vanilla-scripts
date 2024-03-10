ScriptName Fragments:Quests:QF_CF02_Ragana_SpeechChallen_0010D427 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC Auto Const mandatory
ReferenceAlias Property Alias_Ragana Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_NPC.ForceRefTo(Alias_Ragana.GetShipRef() as ObjectReference)
EndFunction
