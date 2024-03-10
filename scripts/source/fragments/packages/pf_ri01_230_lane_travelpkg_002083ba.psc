ScriptName Fragments:Packages:PF_RI01_230_Lane_TravelPKG_002083BA Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Self.GetOwningQuest().SetStage(240)
EndFunction
