ScriptName Fragments:Quests:QF_RI01_JobAdRadio_002C9C96 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI01 Auto Const mandatory
Activator Property RI01_AdRadio Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If !RI01.IsActive() && !RI01.IsCompleted() && Game.FindClosestReferenceOfTYpeFromRef(RI01_AdRadio as Form, Game.GetPlayer() as ObjectReference, 20.0) != None
    RI01.SetStage(100)
  EndIf
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop()
EndFunction
