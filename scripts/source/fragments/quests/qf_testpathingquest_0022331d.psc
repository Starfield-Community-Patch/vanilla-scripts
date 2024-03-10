ScriptName Fragments:Quests:QF_TestPathingQuest_0022331D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TestExterior01 Auto Const mandatory
ReferenceAlias Property Alias_TestExterior02 Auto Const mandatory
ReferenceAlias Property Alias_TestInterior01 Auto Const mandatory
ReferenceAlias Property Alias_TestInterior02 Auto Const mandatory
ReferenceAlias Property Alias_TestExterior03 Auto Const mandatory
ReferenceAlias Property Alias_TestExterior04 Auto Const mandatory
ReferenceAlias Property Alias_TestInterior03 Auto Const mandatory
ReferenceAlias Property Alias_TestExterior05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_TestExterior01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_TestExterior02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_TestInterior01.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_TestInterior02.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_TestExterior03.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_TestExterior04.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0070_Item_00()
  Alias_TestInterior03.GetActorRef().EvaluatePackage(False)
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_TestExterior05.GetActorRef().EvaluatePackage(False)
EndFunction
