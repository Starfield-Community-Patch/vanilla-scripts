ScriptName Fragments:Packages:PF_SQ_RemoveItem01_TravelToI_0100154E Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Self.GetOwningQuest().SetStage(10)
EndFunction
