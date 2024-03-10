ScriptName Fragments:Scenes:SF_MQ102_014_MoonScene_0028DFE8 Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ102 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script
  kmyQuest.BlockSpaceTravel()
EndFunction

Function Fragment_End()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script
  kmyQuest.UnblockSpaceTravel()
  Self.GetOwningQuest().SetStage(510)
EndFunction
