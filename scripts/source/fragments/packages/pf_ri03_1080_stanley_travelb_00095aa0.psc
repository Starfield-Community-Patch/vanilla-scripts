ScriptName Fragments:Packages:PF_RI03_1080_Stanley_TravelB_00095AA0 Extends Package Const hidden

;-- Functions ---------------------------------------

Function Fragment_End(Actor akActor)
  Self.GetOwningQuest().SetStage(1090)
EndFunction
