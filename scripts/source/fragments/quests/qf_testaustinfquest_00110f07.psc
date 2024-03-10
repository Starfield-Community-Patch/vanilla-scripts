ScriptName Fragments:Quests:QF_TestAustinFQuest_00110F07 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_IDReader Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader")
  readerScript.CallFunction("GotoSuccessState", None)
EndFunction

Function Fragment_Stage_0020_Item_00()
  ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader")
  readerScript.CallFunction("ResetIDCardReader", None)
EndFunction

Function Fragment_Stage_0030_Item_00()
  ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader")
  readerScript.CallFunction("GotoLockdownState", None)
EndFunction
