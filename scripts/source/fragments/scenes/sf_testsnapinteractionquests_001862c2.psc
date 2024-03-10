ScriptName Fragments:Scenes:SF_TestSnapInteractionQuestS_001862C2 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CharGenFurniture Auto Const
ReferenceAlias Property CharacterGenFurniture Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_02_End()
  Actor PlayerREF = Game.GetPlayer()
  ObjectReference MedBenchREF = CharGenFurniture.GetRef()
  PlayerREF.Waitfor3dLoad()
  MedBenchREF.Waitfor3dLoad()
  MedBenchREF.Activate(PlayerREF as ObjectReference, False)
EndFunction
