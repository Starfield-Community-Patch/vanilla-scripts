ScriptName Fragments:Perks:PRKF_VascoShutDownZeroGPlaye_020026A0 Extends Perk Const hidden

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  akTargetRef.Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction
