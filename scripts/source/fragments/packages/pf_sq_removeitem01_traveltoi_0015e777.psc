ScriptName Fragments:Packages:PF_SQ_RemoveItem01_TravelToI_0015E777 Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Self.GetOwningQuest().SetStage(10)
EndFunction
