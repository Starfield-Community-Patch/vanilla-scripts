ScriptName Fragments:Scenes:SF_MQ102_007_SarahVenusSce_0028C697_1 Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script
  kmyQuest.BlockSpaceTravel()
EndFunction

Function Fragment_End()
  mq102script kmyQuest = Self.GetOwningQuest() as mq102script
  kmyQuest.UnBlockSpaceTravel()
  Self.GetOwningQuest().SetStage(410)
EndFunction
