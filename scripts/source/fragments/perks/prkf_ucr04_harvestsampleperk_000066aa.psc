ScriptName Fragments:Perks:PRKF_UCR04_HarvestSamplePerk_000066AA Extends Perk Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property UCR04_SpecimenSample Auto Const mandatory
Quest Property UCR04 Auto Const mandatory
Quest Property DialogueUCFactionAlwaysOn Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
  (DialogueUCFactionAlwaysOn as ucparentfactionquestscript).SendUCR04SampleCollectedEvent(akTargetRef as Actor)
EndFunction
