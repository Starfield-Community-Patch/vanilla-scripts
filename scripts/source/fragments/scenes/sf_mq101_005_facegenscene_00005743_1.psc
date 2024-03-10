ScriptName Fragments:Scenes:SF_MQ101_005_FaceGenScene_00005743_1 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MedBench Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_05_End()
  MedBench.GetRef().Activate(Game.GetPlayer() as ObjectReference, False)
EndFunction
