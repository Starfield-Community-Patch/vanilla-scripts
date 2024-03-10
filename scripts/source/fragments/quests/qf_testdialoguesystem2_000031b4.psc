ScriptName Fragments:Quests:QF_TestDialogueSystem2_000031B4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
affinityevent Property TestWillAffinityEvent Auto Const mandatory
ReferenceAlias Property Alias_TestTeller Auto Const mandatory
ReferenceAlias Property Alias_TestOutsideScene Auto Const mandatory
ObjectReference Property MQ101MagicDoortoVecteraExt Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ101MagicDoortoVecteraExt.Activate(Game.GetPlayer() as ObjectReference, True)
EndFunction
