ScriptName Fragments:Scenes:SF_MQ101_013A_FlightScene_0001E76F Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script
  If kmyQuest.GetStageDone(485) == False
    kmyQuest.SetStage(405)
  EndIf
EndFunction
