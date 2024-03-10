ScriptName Fragments:Packages:PF_SQ_RemoveItem01_TravelToI_01001550 Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Self.GetOwningQuest().SetStage(10)
EndFunction
