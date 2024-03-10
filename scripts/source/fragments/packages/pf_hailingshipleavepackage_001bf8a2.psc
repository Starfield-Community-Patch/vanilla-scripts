ScriptName Fragments:Packages:PF_HailingShipLeavePackage_001BF8A2 Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Self.GetOwningQuest().SetStage(300)
EndFunction
