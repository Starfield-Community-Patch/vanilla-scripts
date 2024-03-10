ScriptName Fragments:Scenes:SF_MQ101_005_FaceGenScene_00005743_2 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property MedBench Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_04_End()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script
  Actor PlayerREF = Game.GetPlayer()
  ObjectReference MedBenchREF = MedBench.GetRef()
  PlayerREF.Waitfor3dLoad()
  MedBenchREF.Waitfor3dLoad()
  PlayerREF.SnapIntoInteraction(MedBenchREF)
  kmyQuest.StartCharGen()
EndFunction

Function Fragment_Phase_05_End()
  Game.SetInCharGen(False, False, False)
  Game.RequestSave()
  Game.SetInCharGen(True, True, False)
EndFunction
