ScriptName Fragments:Quests:QF_RL003_Quest_00398208 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property RL003_ExteriorAmbushTrigger Auto Const
ReferenceAlias Property Alias_ExteriorAmbushTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_ExteriorAmbushTrigger.GetRef().Enable(False)
EndFunction
