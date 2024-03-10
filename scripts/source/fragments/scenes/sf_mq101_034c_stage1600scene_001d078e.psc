ScriptName Fragments:Scenes:SF_MQ101_034c_Stage1600Scene_001D078E Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_End()
  mq101script kmyQuest = Self.GetOwningQuest() as mq101script
  kmyQuest.MQ101EnablePlayerControls()
EndFunction
