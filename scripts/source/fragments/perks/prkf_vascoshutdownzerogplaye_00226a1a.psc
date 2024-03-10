ScriptName Fragments:Perks:PRKF_VascoShutDownZeroGPlaye_00226A1A Extends Perk Const hidden

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  akTargetRef.Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction
