ScriptName Fragments:Perks:PRKF_MS03_JunoActivationPr_000D2883_2 Extends Perk Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property ControlBoardScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  ControlBoardScene.Start()
EndFunction
