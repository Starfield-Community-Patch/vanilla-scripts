ScriptName Fragments:Quests:QF_TestCorrieQuest_002AAC9B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TestMoveToCellMarker Auto Const mandatory
ReferenceAlias Property Alias_TestCorrieActor Auto Const mandatory
ReferenceAlias Property Alias_TestCorrieActor02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Game.GetPlayer().MoveTo(Alias_TestMoveToCellMarker.GetRef(), 0.0, 0.0, 0.0, True, False)
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_TestCorrieActor.GetActorRef().StartCombat(Alias_TestCorrieActor02.GetActorRef() as ObjectReference, False)
EndFunction

Function Fragment_Stage_0400_Item_00()
  Alias_TestCorrieActor.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False)
EndFunction
