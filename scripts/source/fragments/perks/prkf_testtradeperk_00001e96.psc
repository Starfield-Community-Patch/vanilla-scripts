ScriptName Fragments:Perks:PRKF_TestTradePerk_00001E96 Extends Perk Const hidden

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  (akTargetRef as Actor).ShowBarterMenu()
EndFunction
